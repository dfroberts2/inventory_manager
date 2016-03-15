module ResponsiveHelpers
	def resize_window_to_mobile
    	resize_window_by(640, 480)
  	end
 
  	def resize_window_to_tablet
    	resize_window_by(960, 640)
  	end
 
  	def resize_window_default
    	resize_window_by(1024, 768)
  	end
 
	private
 
  	def resize_window_by(width, height)
	  	case Capybara.current_driver
	  	when :selenium
	    	Capybara.current_session.driver.browser.manage.window.resize_to(width, height)
	  	when :webkit
	    	handle = Capybara.current_session.driver.current_window_handle
	    	Capybara.current_session.driver.resize_window_to(handle, width, height)
	  	else
	    	raise NotImplementedError, "resize_window is not supported for #{Capybara.current_driver} driver"
	  	end
	end
end