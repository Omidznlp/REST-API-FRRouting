from django.urls import path
from rip import views

urlpatterns = [
    path('basic/', views.RipBasic.as_view()),
    path('basic/detail/<int:pk>/', views.RipBasicDetail.as_view()),
    path('advanced/', views.RipAdvanced.as_view()),
    path('advanced/detail/<int:pk>/', views.RipAdvancedDetail.as_view())
]
