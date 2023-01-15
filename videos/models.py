from django.db import models

# Create your models here.
class Tag(models.Model):
    description = models.CharField(max_length=255)
    
    class Meta:
        ordering = ['description']

    def __str__(self):
        return self.title    

class Video(models.Model):
    title = models.CharField(max_length=255)
    description = models.CharField(max_length=255)
    visualization = models.IntegerField(default=0)
    tags = models.ManyToManyField(Tag)