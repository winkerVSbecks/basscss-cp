output_dir=./${1:-basscss}

if [ ! -d $output_dir ]; then
  mkdir $output_dir
fi

cp ./node_modules/basscss/css/basscss.css $output_dir/basscss.css
cp ./node_modules/basscss-basic/index.css $output_dir/basic.css

ADDONS=./node_modules/basscss-addons/modules

for i in $ADDONS/*
  do                 # Line breaks are important
    if [ -d $i ]   # Spaces are important
      module=$(basename $i)
      then
        if [ $module = "legacy" ]; then
          continue
        elif [ ! -f $i/css/$module.css ]; then
          cp $i/index.css $output_dir/$module.css
        else
          cp $i/css/$module.css $output_dir/$module.css
        fi
    fi
  done

echo Copied all basscss files into $output_dir
