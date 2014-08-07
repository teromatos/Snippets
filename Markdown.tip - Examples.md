Source: [http://support.microsoft.com/kb/207761](http://support.microsoft.com/kb/207761 "http://support.microsoft.com/kb/207761")
 
### MS Access - Operation must use an updateable query error.###

---
 
**DELETE QUERIES**
 
To resolve this error, set the query's UniqueRecords property to Yes by following these steps:
 
1. Open the delete query in Design view.
1. If the property sheet is not already open, on the View menu, click Properties.
1. Click an empty area in the upper half of the query window so that the property sheet displays "Query Properties" in the title bar.
1. Set the UniqueRecords property to Yes.
1. Save the query, close it, and then run the query.

---

**SELECT & UPDATE QUERIES**
 
To resolve this error, set the query's UniqueRecords property to No by following these steps:
 
1. Open the update query in Design view.
1. If the property sheet is not already open, on the View menu, click Properties.
1. Click an empty area in the upper half of the query window so that the property sheet displays "Query Properties" in the title bar.
1. Set the UniqueRecords property to No.
1. Save the query, close it, and then run the query. 

Check out this neat program I wrote:

    x = 0
    x = 2 + 2
    what is x
    x
    y

*This text will be italic*
_This will also be italic_

**This text will be bold**
__This will also be bold__

*You **can** combine them*

* Item 1
* Item 2
  * Item 2a
  * Item 2b

1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b

As Kanye West said:

> We're living the future so
> the present is our past.

- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
- [x] list syntax required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item


First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column

~~this~~


Image: ![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)

