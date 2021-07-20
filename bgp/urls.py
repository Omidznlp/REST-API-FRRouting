from django.urls import path
from bgp import views

urlpatterns = [
    path('basic/', views.BgpBasic.as_view()),
    path('basic/detail/<int:pk>/', views.BgpBasicDetail.as_view()),
    path('addrfamily/', views.BgpAddrFamily.as_view()),
    path('addrfamily/detail/<int:pk>/', views.BgpAddrFamilyDetail.as_view()),
    path('global/', views.BgpGlobal.as_view()),
    path('global/detail/<int:pk>/', views.BgpGlobalDetail.as_view())
]
