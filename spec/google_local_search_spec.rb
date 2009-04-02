require File.join(File.dirname(__FILE__), "..", "lib", "google_local_search")

describe "GoogleLocalSearch" do

  describe "Geocode" do
    
    before do
      @response = Net::HTTPSuccess.new('1.1', '200', 'OK')
      Net::HTTP.stub!(:get_response).and_return(@response)
      @response.stub!(:body).and_return('{"responseData": {"results":[{"GsearchResultClass":"GlocalSearch","listingType":"local","addressLookupResult":"/maps","lat":"51.533313","lng":"-0.146907","accuracy":"5","title":"London NW1","titleNoFormatting":"London NW1","ddUrl":"http://www.google.com/maps?source\u003duds\u0026daddr\u003dLondon+NW1%2C+London+%28London+NW1%29+%4051.533313%2C-0.146907\u0026saddr","ddUrlToHere":"http://www.google.com/maps?source\u003duds\u0026daddr\u003dLondon+NW1%2C+London+%28London+NW1%29+%4051.533313%2C-0.146907\u0026iwstate1\u003ddir%3Ato","ddUrlFromHere":"http://www.google.com/maps?source\u003duds\u0026saddr\u003dLondon+NW1%2C+London+%28London+NW1%29+%4051.533313%2C-0.146907\u0026iwstate1\u003ddir%3Afrom","streetAddress":"London NW1","city":"London","region":"","country":"GB","staticMapUrl":"http://mt.google.com/mapdata?cc\u003dus\u0026tstyp\u003d5\u0026Point\u003db\u0026Point.latitude_e6\u003d51533313\u0026Point.longitude_e6\u003d-146907\u0026Point.iconid\u003d15\u0026Point\u003de\u0026w\u003d150\u0026h\u003d100\u0026zl\u003d4","url":"http://www.google.com/maps?source\u003duds\u0026q\u003dNW1","postalCode":"NW1","maxAge":604800,"addressLines":["London NW1","UK"]}],"cursor":{"moreResultsUrl":"http://www.google.com/local?oe\u003dutf8\u0026ie\u003dutf8\u0026num\u003d4\u0026mrt\u003dyp%2Cloc\u0026sll\u003d37.779160%2C-122.420090\u0026start\u003d0\u0026hl\u003den\u0026q\u003dNW1"},"viewport":{"center":{"lat":"51.533313","lng":"-0.146907"},"span":{"lat":"0.036858","lng":"0.049982"},"sw":{"lat":"51.514885","lng":"-0.171898"},"ne":{"lat":"51.551743","lng":"-0.121916"}}}, "responseDetails": null, "responseStatus": 200}')
    end
    
    it "should raise ArgumentError if no address supplied" do
      lambda { GoogleLocalSearch::GeoCode.locate.should raise_error(ArgumentError) }
    end
    
    it "should return a Location object" do
      GoogleLocalSearch::GeoCode.locate("NW1").should be_instance_of(GoogleLocalSearch::GeoCode::Location)
    end
    
    it "should have a latitude" do
      GoogleLocalSearch::GeoCode.locate("NW1").lat.should_not be_nil
    end
    
    it "should have a longitude" do
      GoogleLocalSearch::GeoCode.locate("NW1").lng.should_not be_nil
    end
    
  end
  
end
