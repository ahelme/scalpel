#!/bin/zsh
set -e
cd "$(dirname "$0")"
python3 run.py --task tmpl-fe-datepicker,tmpl-fe-colorpicker,tmpl-fe-command,tmpl-fe-dropzone,tmpl-fe-wizard,tmpl-fe-rating,tmpl-be-duplicate,tmpl-be-search,tmpl-be-count,tmpl-be-archive,tmpl-be-bulkdelete,tmpl-be-csv --arms baseline,ponytail,scalpel --models haiku --runs 2 --workers 6
python3 run.py --task safe-path,critic-email,rate-limit,sql-user,auth-token,csv-sum,cache --arms baseline,ponytail,scalpel --models haiku --runs 2 --workers 6
echo "ALL-TIERS-DONE"
