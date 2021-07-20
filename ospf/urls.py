from django.urls import path
from ospf import views

urlpatterns = [
    path('basic/', views.OspfBasic.as_view()),
    path('basic/detail/<int:pk>/', views.OspfBasicDetail.as_view()),
    path('advanced/interface/', views.OspfAdvInterface.as_view()),
    path('advanced/interface/<int:pk>/', views.OspfAdvInterfaceDetail.as_view()),
    path('advanced/area/', views.OspfAdvArea.as_view()),
    path('advanced/area/<int:pk>/', views.OspfAdvAreaDetail.as_view()),
    path('advanced/global/', views.OspfAdvGlobal.as_view()),
    path('advanced/global/<int:pk>/', views.OspfAdvGlobalDetail.as_view())
]
