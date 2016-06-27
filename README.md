# Docker image for the Tuleap Mylyn connector

This image is an helper to build and run the tests of the [Tuleap Mylyn connector](https://gerrit.tuleap.net/#/admin/projects/tuleap-eclipse).

You can run the tests with

     $> docker run -v /path/to/the/sources:/tuleap-mylyn-src enalean/tuleap-mylyn-helper --test

or you can build the packages with

     $> docker run -v /path/to/the/sources:/tuleap-mylyn-src enalean/tuleap-mylyn-helper --build
