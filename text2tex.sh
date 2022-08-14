fname_txt=cuv.txt

function text2TeX {
    abbrbook=$1
    fnametag=`echo "$abbrbook" | tr '[:upper:]' '[:lower:]'`
    book_tex=tex/$fnametag/${fnametag}.tex
    
    if [ ! -d tex/$fnametag ]; then
        mkdir tex/$fnametag
    fi

    if [ -f $book_tex ] ; then
        echo "" > $book_tex
    fi
    for i in `grep "^$abbrbook" $fname_txt | awk '{print $2}' | cut -d: -f1 | uniq`; do
        raw=tex/$fnametag/${fnametag}_${i}.tex.raw
        echo \\bchapter% > $raw; 
        grep "$abbrbook $i:" $fname_txt | cut -d " " -f 3- | awk '{print "\\bv{"NR"}"$0}' >> $raw
        sed -i 's/．/\\yuentien /g' $raw
        sed -i 's/、/\\chientien /g' $raw
        sed -i 's/。/\\chuan /g' $raw
        sed -i 's/ 〔/〔/g' $raw
        sed -i 's/〔/\\chu{/g' $raw
        sed -i 's/〕/}/g' $raw

        echo \\beginnumbering >> $book_tex
        echo \\pstart >> $book_tex
        echo \\input{tex/$fnametag/${fnametag}_${i}.tex} >> $book_tex
        echo \\pend >> $book_tex
        echo \\endnumbering >> $book_tex
    done
}

for b in `cut -d" " -f 1 $fname_txt | uniq `; do
    text2TeX $b
done

for b in `cut -d" " -f 1 $fname_txt | uniq `; do
    fnametag=`echo "$b" | tr '[:upper:]' '[:lower:]'`
    echo \\input{tex/$fnametag/${fnametag}.tex} 
done > main.tex