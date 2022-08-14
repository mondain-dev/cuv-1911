# cuv-1911
官話和合本(1919)

## Dependencies
- uplatex
- Microsoft fonts `simsun.ttc`, `simhei.ttf`

## Build
Make sure that the fonts used in this document are reachable:
```
ln -s /path/to/simsun.ttc simsun.ttc
ln -s /path/to/simhei.ttf simhei.ttf
```
Build using `uplatex`: 
```
uplatex cuv && uplatex cuv && dvipdfmx cuv
```

## References
- [上海大美國聖經公會印官話和合譯本 (1919)](https://bible.fhl.net/ob/nob.html?book=403)
- [香港聖經公會印和合譯本 (1959)](https://bible.fhl.net/ob/nob.html?book=257)
