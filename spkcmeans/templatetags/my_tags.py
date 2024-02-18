from django import template
from spkcmeans.models import *

register = template.Library()

@register.simple_tag
def get_subkriteria_by_kriteria(kriteria_id):
    data = SubKriteria.objects.filter(kriteria_id=kriteria_id)  
    return data

@register.simple_tag
def get_detail_data_uji_by_id_data_uji(id):
    data = DetailDataUji.objects.filter(datauji_id=id)
    return data

@register.filter
def getSubKriteria(id):
   
    data = SubKriteria.objects.get(id_sub = id)
    return data.subkriteria

@register.filter
def getBobotSubKriteria(id):
   
    data = SubKriteria.objects.get(id_sub = id)
    return data.bobot

@register.filter
def getNamaSub(id):
   
    data = SubKriteria.objects.get(id_sub = id)
    return data.subkriteria

@register.filter
def getNamaKriteria(id):
    data = Kriteria.objects.get(id_kriteria = id)
    return data.kriteria

@register.simple_tag
def ubah_data_ke_list(data):
   return data[0]

@register.simple_tag
def counter(val):
    return val+1


#index html...
@register.simple_tag
def getArr(val):
    result = []
    for i in range(len(val)):
        a = val[i][f'iter{i}'][0]
        temp = []
        [temp.append(x) for x in a]
        result.append(temp)
    return result

@register.filter
def matrixU(values,counter):
    views = ''
    views += f'<div class="col-lg-12 d-flex mt-2 justify-content-center"><p>Iterasi ke {counter}<p></div>'
    views += f'<p>Matrix U Random</p>'
    views += f'<table id=""class="table responsive nowrap"width="100%"><thead><tr>'
    temp = []
    [temp.append(x) for x in values[counter-1]]
    for i in range(len(temp[0])):
        views += f'<th>U{i+1}</th>'
    views+= f'</tr></thead>'
    views+= f'<tbody>'
    for i in temp:
        views+=f'<tr>'
        for x in range(len(i)):
            views+=f'<td>{i[x]}</td>'      
    views+=f'</tr></tbody></table>'         
    return views

@register.filter
def pusatCluster(values,counter):

    kriteria = Kriteria.objects.all()
    title = []
    
    for i in range(len(kriteria)):
        col = ''
        col += f'µi1^w * Xi{i+1}'
        title.append(col)

    views = ''
    views += f'<p>Perhitungan pusat cluster</p>' 
    temp = []
    [temp.append(x) for x in values[counter-1]]

    for i in range(len(temp)):
        views += f'<p>cluster {i+1}</p>'
        views += f'<table id=""class="table responsive nowrap"width="100%"><thead><tr>'
        for x in range(len(temp[i][0][0])):
            views += f'<th>{title[x]}</th>'
        views+= f'</tr></thead>'
        views+= f'<tbody>'

        for x in temp[i]:
            for a in range(len(x)):
                views+=f'<tr>'
                for b in range(len(x[a])):
                    views+=f'<td>{x[a][b]}</td>'   
            views+=f'</tr></tbody></table>' 
  
    return views

@register.filter
def hasilpusatCluster(values,counter):
    
    views =''
    views += f'<p>Hasil pusat cluster</p>' 
    views += f'<table id=""class="table responsive nowrap"width="100%"><thead><tr>'

    for i in range(len(values[counter-1][0])):
        views += f'<th></th>'
    views+= f'</tr></thead>'
    views+= f'<tbody>'

    for i in range(len(values[counter-1])):
        views+=f'<tr>'
        for x in range(len(values[counter-1][i])):
            views+=f'<td>{values[counter-1][i][x]}</td>'   
    views+=f'</tr></tbody></table>'
    
    return views


def increment(val):
    return val+1

@register.filter
def fungsiObjektif(values,counter):

    kriteria = Kriteria.objects.all()
    title = []
    a = 0
    b = 0
    
    for i in range(len(kriteria)+2):

        if i <= len(kriteria)-1:
            col = ''
            col += f''
        else:
            ic = increment(b)
            if a == 0:
                col = ''
                col += f'∑Ci{ic}'
                a+=1    
            else:
                col = ''
                col += f'∑Ci*(µi2)w'
            
        title.append(col)  
    views = ''
    views += f'<p>Perhitungan Fungsi Objektif</p>' 
    temp = []
    [temp.append(x) for x in values[counter-1]]
    for i in range(len(temp)):
        views += f'<p>cluster {i+1}</p>'
        views += f'<table id=""class="table responsive nowrap"width="100%"><thead><tr>'
        for x in range(len(temp[i][0][0])):
            views += f'<th>{title[x]}</th>'
        views+= f'</tr></thead>'
        views+= f'<tbody>'

        for x in temp[i]:
            for a in range(len(x)):
                views+=f'<tr>'
                for b in range(len(x[a])):
                    views+=f'<td>{x[a][b]}</td>'   
            views+=f'</tr></tbody></table>' 
  
    return views

@register.filter
def hasilfungsiObjektif(values,counter):

    views = ''
    views = ''
    views += f'<p>Hasil Perhitungan Fungsi Objektif</p>' 
    views += f'<table id=""class="table responsive nowrap"width="100%"><thead><tr>'
    views += f'<th>∑C1*(µ1)w + ∑C2*(µ2)w</th>'
    views+= f'</tr></thead>'
    views+= f'<tbody>'

    for i in range(len(values[counter-1])):
        views+=f'<tr>'
        views+=f'<td>{values[counter-1][i]}</td>'   
    views+=f'</tr></tbody></table>' 
    return views

@register.filter
def cluster(values,counter):

    views = ''
    views = ''
    # views += f'<p class="alert alert-info"> Hasil Akhir CLuster</p>' 
    views += f'<table id="  "class="table responsive nowrap"width="100%"><thead><tr>'
    
    for i in range(counter):
          views += f'<th>U{i+1}</th>'
    for i in range(counter):
          views += f'<th>Cluster {i+1}</th>'
    views+= f'</tr></thead>'
    views+= f'<tbody>'

    for i in values:
        print(i)
        views+=f'<tr>'
        temp = -1
        saveIndex = 0
        for x in range(len(i)):
            if temp<i[x]:
                temp = i[x]
                saveIndex = x
            views+=f'<td>{i[x]}</td>' 
        for x in range(len(i)):
            if x == saveIndex:
                views+=f'<td>X</td>'
            else:
                views+=f'<td></td>'  
    views+=f'</tr></tbody></table>' 
    return views