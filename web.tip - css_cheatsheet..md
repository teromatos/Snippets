Type          | Tag
------------- | -------------
html table    | ```#myid```
css id        | ```.myclass```
html table    | ```<table>```

*NOTE: there can only be 1 id but multiple classes for a html attribute*

**Samples**

Type                                | Tag
----------------------------------- | -------------
```table #myid {}```                | Table with id = myid
```#myid .myclass {}```             | Html attribute with id = myid and class = myclass
```.myclass tr:first-child {}```    | Select first child element of every table row has class = myclass 
```#myid #myid2 table {}```         | Select table attribute that is the child of myid2, which itself is the child of myid.
