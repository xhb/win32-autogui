require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Autogui::Input

describe "FormSplash" do
  after(:all) do
    if @application.running?
      @application.file_exit 
      # still running? force it to close
      @application.close(:wait_for_close => true)
      @application.should_not be_running
    end
  end

  describe "startup with no command line parameters" do
    before(:all) do
      # --nosplash is the default, turn it back on
      @application = Quicknote.new :parameters => ''
      @application.should be_running
    end

    it "should show" do
      @application.splash.should_not be_nil
    end
    it "should close within 5 seconds" do
      pending
    end
  end

  describe "startup with '--nosplash' command line parameter" do
    it "should not show" do
      @application = Quicknote.new :parameters => '--nosplash'
      @application.should be_running
      @application.splash.should be_nil
    end
  end

end