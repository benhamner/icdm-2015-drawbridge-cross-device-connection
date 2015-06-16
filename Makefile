working/cookie_all_basic.csv: input/cookie_all_basic.csv
	tail +2 $^ > $@

working/dev_train_basic.csv: input/dev_train_basic.csv
	tail +2 $^ > $@

working/dev_test_basic.csv: input/dev_test_basic.csv
	tail +2 $^ > $@

working/id_all_ip.csv: input/id_all_ip.csv
	tail +2 $^ > $@

working/id_all_property.csv: input/id_all_property.csv
	tail +2 $^ > $@

working/ipagg_all.csv: input/ipagg_all.csv
	tail +2 $^ > $@

working/property_category.csv: input/property_category.csv
	tail +2 $^ > $@

working/id_all_ip_corrected.csv: working/id_all_ip.csv
	python fix_bad_csv.py $@ $^ 3

working/id_all_property_corrected.csv: working/id_all_property.csv
	python fix_bad_csv.py $@ $^ 3

working/property_category_corrected.csv: working/property_category.csv
	python fix_bad_csv.py $@ $^ 2

working/db.sqlite: working/cookie_all_basic.csv working/dev_train_basic.csv working/dev_test_basic.csv working/id_all_ip_corrected.csv working/id_all_property_corrected.csv working/ipagg_all.csv working/property_category_corrected.csv
	sqlite3 -echo $@ < import.sql

sqlite: working/database.sqlite
