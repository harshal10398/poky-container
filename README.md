Openwrt/QSDK Builder
========================

Running the container
---------------------
Here a very simple but usable scenario for using the container is described.
It is by no means the *only* way to run the container, but is a great starting
point.

* **Create a workdir or volume**
  * **Linux**

    The workdir you create will be used for the output created while using the container.
    For example a user could create a directory using the command
  
    ```
    mkdir -p /home/myuser/mystuff
    ```

    *It is important that you are the owner of the directory.* The owner of the
    directory is what determines the user id used inside the container. If you
    are not the owner of the directory, you may not have access to the files the
    container creates.

    For the rest of the Linux instructions we'll assume the workdir chosen was
    `/home/myuser/mystuff`.


* **The docker command**
  * **Linux**

    Assuming you used the *workdir* from above, the command
    to run a container for the first time would be:

    ```
    docker run --rm -it -v /home/myuser/mystuff:/workdir harshalgohel/openwrt-builder
    ```
    
    Open new terminal and type 
    ```
    docker ps
    ```

    Check the name of running container, you may also use --name in ```docker run``` command above to specify name.

    ```
    docker exec -ti -u yoctouser bash
    ```
