import codecs
import os
from setuptools import setup, find_packages


# Prevent spurious errors during `python setup.py test`, a la
# http://www.eby-sarna.com/pipermail/peak/2010-May/003357.html:
try:
    import multiprocessing
except ImportError:
    pass


setup(
    name='socorro-lib',
    version='master',
    description=('Socorro-Lib is a library for handling crash reports.'),
    author='Mozilla',
    author_email='socorro-dev@mozilla.com',
    license='MPL',
    url='https://github.com/mozilla/socorro',
    classifiers=[
        'Intended Audience :: Developers',
        'Intended Audience :: System Administrators',
        'License :: OSI Approved :: MPL License',
        'Programming Language :: Python :: 2.6',
        'Programming Language :: Python :: 2.7',
        'Topic :: Internet :: WWW/HTTP :: WSGI :: Application',
        ],
    keywords=['socorro', 'breakpad', 'crash', 'reporting', 'minidump',
              'stacktrace'],
    packages=find_packages(),
    install_requires=['configman==1.2.8', 'configobj==4.7.2',
        'isodate==0.4.7', 'elasticsearch==1.2', 'elasticsearch-dsl==0.0.2',
        'pyelasticsearch==0.6.1', 'urllib3==1.9.1', 'elasticutils==0.7',
        'raven==3.4.1', 'requests==1.2.3', 'simplejson==2.5.0', 'six==1.7.3',
        'statsd==2.1.2', 'wsgiref==0.1.2', 'ujson==1.33',
        'python-dateutil==2.1', 'ordereddict==1.1', 'boto==2.28.0',
        'path.py==5.1', 'web.py==0.36'],
    entry_points={
        'console_scripts': [
                'socorro = socorro.app.socorro_app:SocorroWelcomeApp.run'
            ],
        },
    test_suite='nose.collector',
    zip_safe=False,
),
