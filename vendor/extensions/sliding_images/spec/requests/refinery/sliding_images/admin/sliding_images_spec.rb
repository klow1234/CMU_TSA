# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "SlidingImages" do
    describe "Admin" do
      describe "sliding_images" do
        login_refinery_user

        describe "sliding_images list" do
          before(:each) do
            FactoryGirl.create(:sliding_image, :name => "UniqueTitleOne")
            FactoryGirl.create(:sliding_image, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.sliding_images_admin_sliding_images_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.sliding_images_admin_sliding_images_path

            click_link "Add New Sliding Image"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::SlidingImages::SlidingImage.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::SlidingImages::SlidingImage.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:sliding_image, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.sliding_images_admin_sliding_images_path

              click_link "Add New Sliding Image"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::SlidingImages::SlidingImage.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:sliding_image, :name => "A name") }

          it "should succeed" do
            visit refinery.sliding_images_admin_sliding_images_path

            within ".actions" do
              click_link "Edit this sliding image"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:sliding_image, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.sliding_images_admin_sliding_images_path

            click_link "Remove this sliding image forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::SlidingImages::SlidingImage.count.should == 0
          end
        end

      end
    end
  end
end
