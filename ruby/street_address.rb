require 'cgi'
require 'json'
require 'net/https'

# Remember to URL encode anything that could have 
# spaces (street, city) or special characters (auth-token).

# Obtain an authentication ID/token pair from your
# SmartyStreets account and put them in below.
uri = URI('https://us-street.api.smartystreets.com/street-address')
args = {
	'street' => '1 infinite loop', 
	'city' => 'cupertino', 
	'state' => 'ca', 
	'auth-id' => 'YOUR_AUTH_ID_HERE', 
	'auth-token' =>'YOUR_AUTH_TOKEN_HERE',
}
uri.query = URI.encode_www_form(args)
response = Net::HTTP.get_response(uri)
puts JSON.pretty_generate(JSON.parse(response.body))

# SAMPLE OUTPUT:
#
#[
#  {
#    "input_index": 0,
#    "candidate_index": 0,
#    "delivery_line_1": "1 Infinite Loop",
#    "last_line": "Cupertino CA 95014-2083",
#    "delivery_point_barcode": "950142083017",
#    "components": {
#      "primary_number": "1",
#      "street_name": "Infinite",
#      "street_suffix": "Loop",
#      "city_name": "Cupertino",
#      "state_abbreviation": "CA",
#      "zipcode": "95014",
#      "plus4_code": "2083",
#      "delivery_point": "01",
#      "delivery_point_check_digit": "7"
#    },
#    "metadata": {
#      "record_type": "S",
#      "county_fips": "06085",
#      "county_name": "Santa Clara",
#      "carrier_route": "C067",
#      "congressional_district": "15",
#      "latitude": 37.33118,
#      "longitude": -122.03062,
#      "precision": "Zip9"
#    },
#    "analysis": {
#      "dpv_match_code": "Y",
#      "dpv_footnotes": "AABB",
#      "dpv_cmra": "N",
#      "dpv_vacant": "N",
#      "ews_match": false
#    }
#  }
#]
