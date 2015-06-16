.separator ","

CREATE TABLE cookies (
    drawbridge_handle,
    cookie_id,
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
    device_id,
    device_type,
    device_os,
    country,
    anonymous_c0,
    anonymous_c1,
    anonymous_c2,
    anonymous_5,
    anonymous_6,
    anonymous_7);

CREATE TABLE ips (
    device_or_cookie_id,
    device_or_cookie_indicator,
    ip,
    ip_freq_count,
    idxip_anonymous_c1,
    idxip_anonymous_c2,
    idxip_anonymous_c3,
    idxip_anonymous_c4,
    idxip_anonymous_c5);

CREATE TABLE properties (
    device_or_cookie_id,
    device_or_cookie_indicator,
    property_id,
    unique_days_seeing_property_on_device_or_cookie_id);

CREATE TABLE ip_agg (
    ip_address,
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
.import "working/id_all_ip_corrected.csv" ips
.import "working/id_all_property_corrected.csv" properties
.import "working/ipagg_all.csv" ip_agg
.import "working/property_category_corrected.csv" property_categories
