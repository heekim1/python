# Python

Centrally manage the Python installation for all CTD projects. 

## Packages

The `/tmp/python_pip_requirements.txt` in the [build/build.sh](build/build.sh) script contains the list of packages that are installed with this distribution.

## Making releases

Make the necessary changes, update the [pom.xml](pom.xml) version and run the [Jenkins job](http://jenkins-rss.roche.com/job/BFX/job/Oncology/job/SW-package-management-python/) to make a new release.

Note: You must create a tag for the release.

## Setting global environment variables

It is possible to set [global environment variables](https://docs.python.org/3/using/cmdline.html) to enhance the behavior of Python. These can be set in the [build/debian/control.gsp](build/debian/control.gsp) file in the `Environment` section.

## Usage

Include this dependency in your `pom.xml`:

```xml
<dependency>
  <groupId>com.heekim.dev</groupId>
  <artifactId>python</artifactId>
  <version>3.5.3-5</version> <!-- For Ubuntu 18.04 -->
  <type>deb</type>
</dependency>
```

## Releases

* v3.5.3-4: Ubuntu 16.04 build
* v3.5.3-5: Ubuntu 18.04 build
* v3.5.6: Ubuntu 18.04 build
