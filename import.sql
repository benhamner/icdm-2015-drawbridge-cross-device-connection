.separator ","

CREATE TABLE cookies (
    drawbridge_handle,
    cookie_id PRIMARY KEY,
    computer_os_type,
    browser_version,
    country,
    anonymous_c0,
    anonymous_c1,
    anonymous_c2,
    anonymous_5,
    anonymous_6,
    anonymous_7);

CREATE TABLE devices (
    drawbridge_handle,
    device_id PRIMARY KEY,
    device_type,
    device_os,
    country,
    anonymous_c0,
    anonymous_c1,
    anonymous_c2,
    anonymous_5,
    anonymous_6,
    anonymous_7);

CREATE TABLE id_ips (
    device_or_cookie_id,
    device_or_cookie_indicator,
    ip,
    ip_freq_count,
    idxip_anonymous_c1,
    idxip_anonymous_c2,
    idxip_anonymous_c3,
    idxip_anonymous_c4,
    idxip_anonymous_c5);

CREATE TABLE id_properties (
    device_or_cookie_id,
    device_or_cookie_indicator,
    property_id,
    unique_days_seeing_property_on_device_or_cookie_id);

CREATE TABLE ips (
    ip_address PRIMARY KEY,
    is_cellular_ip,
    ip_total_freq,
    ip_anonymous_c0,
    ip_anonymous_c1,
    ip_anonymous_c2);

CREATE TABLE property_categories (
    property_id,
    category_id);

.import "working/cookie_all_basic.csv" cookies
.import "working/dev_train_basic.csv" devices
.import "working/dev_test_basic.csv" devices
.import "working/id_all_ip_corrected.csv" id_ips
.import "working/id_all_property_corrected.csv" id_properties
.import "working/ipagg_all.csv" ips
.import "working/property_category_corrected.csv" property_categories

CREATE INDEX cookies_drawbridge_handle_ix ON cookies (drawbridge_handle);

CREATE INDEX devices_drawbridge_handle_ix ON devices (drawbridge_handle);

CREATE INDEX id_ips_device_or_cookie_id_ix ON id_ips (device_or_cookie_id);
CREATE INDEX id_ips_device_or_cookie_indicator_ix ON id_ips (device_or_cookie_indicator);
CREATE INDEX id_ips_ip ON id_ips (ip);

CREATE INDEX id_properties_device_or_cookie_id_ix ON id_properties (device_or_cookie_id);
CREATE INDEX id_properties_device_or_cookie_indicator_ix ON id_properties (device_or_cookie_indicator);
CREATE INDEX id_properties_property_id_ix ON id_properties (property_id);

CREATE INDEX property_categories_property_id_ix ON property_categories (property_id);
CREATE INDEX property_categories_category_id_ix ON property_categories (category_id);
