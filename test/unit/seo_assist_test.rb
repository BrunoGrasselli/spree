require 'test_helper'

class SeoAssistTest < ActiveSupport::TestCase
  context SeoAssist do

    context 'call' do 
      setup do
        @environment = Rack::MockRequest.env_for('http://localhost:3000/t/category/hamburgueres/?_=1274299012114')
      end

      should 'redirect to a valid location' do
        expected_result = [301, { 'Location'=> '/t/category/hamburgueres?_=1274299012114' }, []]

        assert_equal SeoAssist.call(@environment), expected_result
      end

      should 'redirect to a valid location with a SCRIPT_NAME' do
        @environment['SCRIPT_NAME'] = '/context'

        expected_result = [301, { 'Location'=> '/context/t/category/hamburgueres?_=1274299012114' }, []]

        assert_equal SeoAssist.call(@environment), expected_result
      end
    end
  end
end
