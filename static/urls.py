from django.urls import path
from static import views

urlpatterns = [
    path('basic/', views.StaticBasic.as_view()),
    path('basic/detail/<int:pk>/', views.StaticBasicDetail.as_view())
]
