from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.urls import path, re_path
from django.views.generic import TemplateView

urlpatterns = [
    path('admin/', admin.site.urls),
    *staticfiles_urlpatterns(),
    re_path("", TemplateView.as_view(template_name="index.html", extra_context={
        "random": 4
    })),
]
