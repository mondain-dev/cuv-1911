# cuv-1911
官話和合本(1911)
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
