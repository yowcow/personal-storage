Personal Storage
================

Prerequisite
------------

Have followings installed and prepared:

* GnuPG
* Google Cloud SDK
* Make

How to use
----------

Configure gcloud command:

```
gcloud auth login
gcloud config set project <PROJECT_ID>
```

To download and decrypt files:

```
make download decrypt
```

To encrypt and upload files:

```
make encrypt upload
```
