# xva2vdi

### Orientações de uso

1. Baixar repositório: 

```
git clone https://github.com/cairoapcampos/xva2vdi.git
```
2. Mover a imagem a ser convertida para o diretório do projeto:

```
mv vm.xva xva2vdi/
```
3. Entrar no diretório:

```
cd xva2vdi/
```
4. Editar o arquivo xva2vdi.sh:

```
nano xva2vdi.sh

As seguintes linhas devem ser alteradas:

inputVM=inputVM.xva -> Define o nome da VM .xva a ser convertida para .img
outputImg=outputImg.img -> Define o nome da imagem a ser gerada apartir da vm .xva
outputDisc=outputDisc.vdi -> Define o nome do disco vdi a ser gerado apartir da imagem .img
```

5. Rodar o script:

```
./xva2vdi.sh
```


