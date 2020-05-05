@rem ### Parameters ###
set DATA="data"
set HOJIN="data/hojin"
set HOJIN_CSV="data/hojin/csv"
set HOJIN_ZIP="data/hojin/zip"
set HOJIN_OUTPUT="data/hojin/output"

@echo === Hojin Data Preparation ==

@rem ### Create directories ###

@rem # corpora, dictionaries
mkdir -p data\corpora\bccwj > NUL 2>&1
mkdir -p data\corpora\mainichi > NUL 2>&1
mkdir -p data\corpora\output > NUL 2>&1

mkdir -p data\dictionaries\ipadic >NUL 2>&1
mkdir -p data\dictionaries\ipadic-neologd >NUL 2>&1
mkdir -p data\dictionaries\juman >NUL 2>&1
mkdir -p data\dictionaries\output >NUL 2>&1

@rem # model
mkdir ckpts >NUL 2>&1

@rem # hojin data
@echo Create Directories...
mkdir -p data/hojin/csv >NUL 2>&1
mkdir -p data/hojin/zip >NUL 2>&1
mkdir -p data/hojin/output >NUL 2>&1


echo "  $HOJIN_ZIP, $HOJIN_CSV, $HOJIN_OUTPUT"

echo "Make sure you have downloaded ZIP files to data\hojin\zip"
### Extract Hojin CSV file ###
if [ -z "$ls -A -- $HOJIN_ZIP" ]
then
  echo "$HOJIN_ZIP is empty, make sure the ZIP files are downloaded."
  exit 1
else
  echo "Begin extracting ZIP to CSV files..."
  cd $HOJIN_ZIP

  for %%l in ("*.zip") do (
    powershell expand-archive %%l -Force
  )

  cd -
  mv $HOJIN_ZIP/*.csv $HOJIN_CSV/ 
  rm $HOJIN_ZIP/*.asc
fi

echo ${green}=== Hojin Data Preparation Done===${reset}