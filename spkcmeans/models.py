import uuid
from django.db import models


class Kriteria(models.Model):

    id_kriteria = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    kriteria = models.CharField(max_length=50)

    class Meta:
        db_table = 'tb_kriteria'



class SubKriteria(models.Model):

    id_sub = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    subkriteria = models.CharField(max_length=50)
    bobot = models.FloatField()
    kriteria = models.ForeignKey(Kriteria, on_delete=models.CASCADE)

    class Meta:
        db_table = 'tb_subkriteria'


class DataUji(models.Model):
    
    id_datauji = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    nama = models.CharField(max_length=50)

    class Meta:
        db_table = 'tb_datauji'


class DetailDataUji(models.Model):
    
    datauji = models.ForeignKey(DataUji, on_delete=models.CASCADE)
    kriteria = models.ForeignKey(Kriteria, on_delete=models.CASCADE)
    subkriteria = models.ForeignKey(SubKriteria, on_delete=models.CASCADE)
   
    class Meta:
        db_table = 'tb_detaildatauji'