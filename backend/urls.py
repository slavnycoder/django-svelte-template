from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.urls import path, re_path
from django.views.generic import TemplateView

from common.utils import random_str
from common.views import health_view

urlpatterns = [
    path('admin/', admin.site.urls),
    path('health/', health_view),
    re_path("", TemplateView.as_view(template_name="index.html", extra_context={
        "random": random_str(8)
    })),
    *staticfiles_urlpatterns(),
]
