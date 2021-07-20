from django.urls import path
from policyroutes import views

urlpatterns = [
    path('pbr/', views.Pbr.as_view()),
    path('pbr/detail/<int:pk>/', views.PbrDetail.as_view()),
    path('routemap/accesslist/', views.RouteMapAccessList.as_view()),
    path('routemap/accesslist/detail/<int:pk>/', views.RouteMapAcessListDetail.as_view()),
    path('routemap/prefixlist/', views.RouteMapPreFixList.as_view()),
    path('routemap/prefixlist/detail/<int:pk>/', views.RouteMapPreFixListDetail.as_view()),
    path('routemap/', views.RouteMap.as_view()),
    path('routemap/detail/<int:pk>/', views.RouteMapDetail.as_view())
]
