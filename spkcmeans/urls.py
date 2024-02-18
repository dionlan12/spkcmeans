from django.urls import path,include
from spkcmeans.views import *

urlpatterns = [
    path('',index, name='indexFuzzyCmeans'),
    path('kriteria/',kriteria,name='kriteria'),
    path('delkriteria/<str:id>',delKriteria,name='delKriteria'),
    path('editkriteria/<str:id>',editKriteria,name='editKriteria'),

    path('detail/<str:id>',detail,name='detailKriteria'),
    path('deldetail/<str:id>',delDetail,name='delDetail'),
    
    path('datauji/',dataUji,name='dataUji'),
    path('deldatauji/<str:id>',delDataUji,name='delDataUji'),
    path('editdatauji/<str:id>',editDataUji,name='editDataUji'),
    
]
