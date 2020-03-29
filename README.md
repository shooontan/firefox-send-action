# Firefox Send action

This action uploads file(s) to [Firefox Send](https://send.firefox.com/).

![](https://user-images.githubusercontent.com/26014062/77845729-0fd41800-71ec-11ea-88c2-eaf0b2523293.png)

## Usage

```yml
steps:
  - name: Firefox Send action step
    uses: shooontan/firefox-send-action@v1
    with:
      file: fixtures/hello.txt
      expiry_time: 5m
      password: ${{ secrets.FFSEND_PASSWORD }}
```


### Inputs

- `file` (required): The file(s) to upload. If `file` is directory, it is automatically archived.
- `expiry_time` (optional): The file expiry time.
- `password` (optional): Protect the file with a password.


### Outputs

- `url`: Share URL.

```yml
steps:
    - name: Firefox Send action step
      uses: shooontan/firefox-send-action@v1
      id: ffsend # output is
      with:
        file: fixtures
        expiry_time: 1m
        password: ${{ secrets.FFSEND_PASSWORD }}
    - name: Get the output url
      run: echo ${{ steps.ffsend.outputs.url }} # show URL
```

![](https://user-images.githubusercontent.com/26014062/77845674-b4098f00-71eb-11ea-90f1-f1a306cd97ca.png)
