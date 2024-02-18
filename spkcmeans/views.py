from django.shortcuts import render,redirect
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.contrib import messages
from .models import *

from django.db import connection
import random
import uuid

dataViews = {}

def dictfetchall(cursor):
    columns = [col[0] for col in cursor.description]
    return [dict(zip(columns, row)) for row in cursor.fetchall()]

def cariAngkaRandom(_JUMLAH_CLUSTER,dataSetList):
   
    listAngkaRandom = []
    for index in range(len(dataSetList)):
        angkaRandom = []
        for i in range(_JUMLAH_CLUSTER):
            angkaRandom.append(random.uniform(1,0))
        total = sum(angkaRandom)
        listAngkaRandom.append([x/total for x in angkaRandom])

    return listAngkaRandom

def perhitunganPusatCluster(dataCmeans,_JUM_CLUSTER,_JUM_MATRIX_U):

    _cluster = []
    for cluster in range(_JUM_CLUSTER):
        _jumlah = []
        for j in range(len(dataCmeans[0][0][0])):   
            _jumlah.append(sum([row[j] for row in dataCmeans[cluster][0]]) /_JUM_MATRIX_U[cluster])
        _cluster.append(_jumlah)  
    return _cluster 

def perhitunganFungsiObjektif(pClaster,dataList,_MATRIX_U,_PANGKAT):
    
    _cluster = []
    for i in range(len(pClaster)):
        index = 0
        temp = [] 
        for j in range(len(dataList)):   
            arr = [] 
            for index, k in enumerate(dataList[j]):
                arr.append((k-pClaster[i][index])**_PANGKAT)
            arr.append(sum([x for x in arr]))
            arr.append(arr[-1] * _MATRIX_U[j][i]**_PANGKAT )
            temp.append(arr)
        _cluster.append([temp])
        # dataViews['perhitunganFungsiObjectif'] = _cluster

    return _cluster

def carimatrixubaru(fungsiObjektif,_JUMLAH_CLUSTER):

    matrixUbaru = []
    for i in range(_JUMLAH_CLUSTER):
        temp = []
        for j in range(len(fungsiObjektif[i][0])):
            temp.append(fungsiObjektif[i][0][j][-2] / sum(x[0][j][-2] for x in fungsiObjektif))
            pass
        matrixUbaru.append(temp)

    return matrixUbaru

def index(req):
    
    if req.method == "POST":

        dataViews['bobot'] = []
        dataViews['matrixURandom'] = []
        dataViews['perhitunganPusatKlaster'] = []
        dataViews['hasilPusatKlaster'] = []
        dataViews['perhitunganFungsiObjectif'] = []
        dataViews['hasilFungsiObjektif'] = []
        dataViews['matrixUbaruIter'] = []
        dataViews['cluster'] = []

        dataPengujian = DataUji.objects.all().order_by('nama').values()
        dataKriteria = Kriteria.objects.all
        dataPengujianArr = []

        for i in dataPengujian:
            print(i['nama'])
            temp=[]
            getDataById = DetailDataUji.objects.filter(datauji_id=i['id_datauji']).values()
            for j in getDataById:
                idSUb = str(j['subkriteria_id']).replace('-','')
                getBobot = SubKriteria.objects.get(id_sub=idSUb)
                temp.append(getBobot.bobot)
            dataPengujianArr.append(temp)
        
        # dataPengujianArr = datasetList
        dataViews['bobot'] = dataPengujianArr

        _JUMLAH_CLUSTER = int(req.POST['klaster'])
        _A_RANDOM = cariAngkaRandom(_JUMLAH_CLUSTER,dataPengujianArr)
        # _A_RANDOM = angkaRandom
        _PANGKAT = int(req.POST['pangkat'])
        _MAX_ITER = int(req.POST['maxiter'])
        _EROR_TERKECIL = float(req.POST['error'])
        _FUNGSI_OBJECTIF_AWAL= int(req.POST['fo'])
        _MATRIX_U = _A_RANDOM

        dataInput = {
            'JUMLAH_CLUSTER': _JUMLAH_CLUSTER,
            'PANGKAT': _PANGKAT,
            'MAX_ITER': _MAX_ITER,
            'EROR_TERKECIL':_EROR_TERKECIL,
            'FUNGSI_OBJECTIF_AWAL': _FUNGSI_OBJECTIF_AWAL       
        }

        dataViews['matrixURandom'] = _A_RANDOM
        matrixUBaru = []
      
        for iter in range(_MAX_ITER):
            if iter == 0:
                dataViews['matrixUbaruIter'].append({f'iter{iter}':[_A_RANDOM]})
            else:
                dataViews['matrixUbaruIter'].append({f'iter{iter}':[_MATRIX_U]})
            dataCmeans = []
            _JUM_MATRIX_U = [] 
            print(f'------Iter {iter+1}------')
            for pangkat in range(_JUMLAH_CLUSTER):
                jumMatrix = 0
                temp2 = []
                for ind, data in enumerate(dataPengujianArr):
                    temp = []
                    [temp.append(i*(_MATRIX_U[ind][pangkat]**_PANGKAT)) for i in data ]
                    temp2.append(temp)
                    jumMatrix += _MATRIX_U[ind][pangkat]**_PANGKAT
                
                _JUM_MATRIX_U.append(jumMatrix)
                dataCmeans.append([temp2])
                
            dataViews['perhitunganPusatKlaster'].append({f'iter{iter}':[dataCmeans]})
            pusatCLuster = perhitunganPusatCluster(dataCmeans,_JUMLAH_CLUSTER,_JUM_MATRIX_U)
            dataViews['hasilPusatKlaster'].append({f'iter{iter}':[pusatCLuster]})
            fungsiObjektif = perhitunganFungsiObjektif(pusatCLuster,dataPengujianArr,_MATRIX_U,_PANGKAT)
            dataViews['perhitunganFungsiObjectif'].append({f'iter{iter}':[fungsiObjektif]}) 
            hasilFungsiObj = []
            for j in range(len(dataPengujianArr)):
                hasilFungsiObj.append(sum(x[0][j][-1] for x in fungsiObjektif))
            hasilFungsiObj.append(sum(hasilFungsiObj))
            matrixUBaru = carimatrixubaru(fungsiObjektif,_JUMLAH_CLUSTER)
            dataViews['hasilFungsiObjektif'].append({f'iter{iter}':[hasilFungsiObj]})

            tmp = []
            for i in range(len(dataPengujianArr)):
                tmp2 = []
                for j in range(_JUMLAH_CLUSTER):
                    tmp2.append(matrixUBaru[j][i])
                tmp.append(tmp2)

            matrixUBaru = tmp     
            
            #CEK KONDISI BERHENTI   

            cek_kondisi = abs(hasilFungsiObj[-1] - _FUNGSI_OBJECTIF_AWAL)

            if cek_kondisi < _EROR_TERKECIL:
                print('perhitungan selesai....')
                dataViews['cluster'] = matrixUBaru
                break
            else :
                _FUNGSI_OBJECTIF_AWAL = hasilFungsiObj[-1]
                _MATRIX_U = matrixUBaru 

        return render(req,'spkcmeans/index.html',{
            'dataViews':dataViews,
            'dataKriteria':dataKriteria,
            'dataInput':dataInput,
            'iterasiFCM': len(dataViews['matrixUbaruIter'])
            })
    else:
        return render(req,'spkcmeans/index.html',{})


def kriteria(req):

    if req.method == "POST":
        addData = Kriteria(
            kriteria=req.POST['kriteria'],
        )
        addData.save()
        return redirect(req.META.get('HTTP_REFERER', '/'))
    else:
        dataKriteria = Kriteria.objects.all()
        return render(req,'spkcmeans/kriteria.html',{'getAllKriteria': dataKriteria})

def delKriteria(req,id):
    
    with connection.cursor() as cursor:
            try:
                cursor.execute('DELETE FROM tb_kriteria WHERE id_kriteria = %s',[id.replace('-','')])
                return redirect(req.META.get('HTTP_REFERER', '/'))
            except:
                messages.error(req,'periksa data yang berelasi..')
                return redirect(req.META.get('HTTP_REFERER', '/'))              
            finally:
                cursor.close()

def editKriteria(req,id):

    if req.method == "POST":
        kriteria = Kriteria.objects.get(id_kriteria=id.replace('-',''))
        kriteria.id_kriteria = id.replace('-','')
        kriteria.kriteria = req.POST['kriteria']
        kriteria.save()
        messages.success(req,'Data berhasil di update')
        return HttpResponseRedirect(reverse('kriteria'))    
    else:   
        kriteria = Kriteria.objects.get(id_kriteria = id.replace('-',''))
        return render(req,'spkcmeans/editkriteria.html',{
            'kriteria': kriteria
        })

def detail(req,id):
    id_sub = str(uuid.uuid4())
    if req.method == "POST":
        with connection.cursor() as cursor:
            try:
                subkriteria = req.POST['subkriteria']
                bobot = req.POST['bobot']
                kriteria_id = req.POST['kriteria_id']
                id_sub = str(uuid.uuid4())
                cursor.execute(
                    'INSERT INTO tb_subkriteria (id_sub,subkriteria,bobot,kriteria_id) VALUES (%s,%s,%s,%s)',[id_sub.replace('-',''),subkriteria,bobot,kriteria_id.replace('-','')]
                    )
                connection.commit()
                return redirect(req.META.get('HTTP_REFERER', '/'))
            finally:
                cursor.close()
    else:
        with connection.cursor() as cursor:
            try:
                cursor.execute('SELECT * FROM tb_subkriteria WHERE kriteria_id = %s',[id.replace('-','')])
                dataId = dictfetchall(cursor)
            
                return render(req,'spkcmeans/detail.html',{
                    'getDatabyId' : dataId,
                    'idK': id
                })

            finally:
                cursor.close()

def delDetail(req,id):

    with connection.cursor() as cursor:
            try:
                cursor.execute('DELETE FROM tb_subkriteria WHERE id_sub = %s',[id])
                return redirect(req.META.get('HTTP_REFERER', '/'))
            finally:
                cursor.close()

def dataUji(req):

    if req.method == "POST":
        with connection.cursor() as cursor:
            try:
                id_datauji = str(uuid.uuid4())
                nama = req.POST['nama']
                dataKriteria = Kriteria.objects.all().values()
                cursor.execute(
                    'INSERT INTO tb_datauji (id_datauji,nama) VALUES (%s,%s)',[id_datauji.replace('-',''),nama]
                    )
                connection.commit()
    
                ind = 0
                for i in dataKriteria:
                    k = req.POST.getlist('kriteria','')
                    s = req.POST.getlist('subkrit','')
                    cursor.execute(
                    'INSERT INTO tb_detaildatauji (datauji_id,kriteria_id,subkriteria_id) VALUES (%s,%s,%s)',[id_datauji.replace('-',''),k[ind].replace('-',''),s[ind].replace('-','')]
                    )      
                    connection.commit() 
                    ind += 1
                return redirect(req.META.get('HTTP_REFERER', '/'))
            finally:
                cursor.close()
    else:
        dataUji = DataUji.objects.all()
        dataKriteria = Kriteria.objects.all()
        return render(req,'spkcmeans/datauji.html',{
            'dataUji': dataUji,
            'getAllKriteria':dataKriteria
        })
 
def delDataUji(req,id):
    with connection.cursor() as cursor:
        try:
            cursor.execute('DELETE FROM tb_detaildatauji WHERE datauji_id = %s',[id.replace('-','')])
            cursor.execute('DELETE FROM tb_datauji WHERE id_datauji = %s',[id.replace('-','')])
            return redirect(req.META.get('HTTP_REFERER', '/'))
        finally:
            cursor.close()

def editDataUji(req,id):

    if req.method == "POST":
        DetailDataUji.objects.filter(datauji_id=id.replace('-','')).delete()
        dataKriteria = Kriteria.objects.all() 
        ind = 0
        k = req.POST.getlist('krit')
        s = req.POST.getlist('subkrit')
        try:
            for kriteria in dataKriteria:  
                tambah_data = DetailDataUji(
                    datauji_id=id.replace('-',''),
                    kriteria_id=k[ind].replace('-',''),
                    subkriteria_id=s[ind].replace('-',''),
                )
                ind+=1
                tambah_data.save()
                dataUji = DataUji.objects.get(id_datauji=id.replace('-',''))
                dataUji.id_datauji = id.replace('-','')
                dataUji.nama = req.POST['nama']
                dataUji.save()
                messages.success(req,'Data berhasil di update')
            return HttpResponseRedirect(reverse('dataUji'))    
        except:
            messages.error('eror')
    else:
        dataKriteria = Kriteria.objects.all().values()
        dataUji = DataUji.objects.get(id_datauji=id.replace('-',''))   
        detaildataUji = DetailDataUji.objects.filter(datauji_id = id.replace('-',''))
        return render(req,'spkcmeans/editdatauji.html',{
            'datauji': dataUji,
            'detaildatauji':detaildataUji,
            'getAllKriteria':dataKriteria,
            'idD': id
        })
    