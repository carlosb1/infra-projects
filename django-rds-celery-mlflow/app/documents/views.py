from django.shortcuts import render

# Create your views here.
# documents/views.py
from django.shortcuts import render
from django.http import HttpResponse
from .forms import DocumentForm
from documents.tasks import add

def document_upload(request):
    if request.method == 'POST':
        form = DocumentForm(request.POST)
        if form.is_valid():
            #form.save()  # Save the form data to the database
            add.delay(1, 2,)
            return HttpResponse("Document saved successfully!")
    else:
        form = DocumentForm()

    return render(request, 'documents/home.html', {'form': form})
