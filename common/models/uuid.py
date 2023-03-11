from uuid import uuid1

from django.db import models


class UUIDModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid1, editable=False)

    class Meta:
        abstract = True
