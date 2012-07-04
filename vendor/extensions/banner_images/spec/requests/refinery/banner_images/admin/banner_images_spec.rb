# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "BannerImages" do
    describe "Admin" do
      describe "banner_images" do
        login_refinery_user

        describe "banner_images list" do
          before(:each) do
            FactoryGirl.create(:banner_image, :name => "UniqueTitleOne")
            FactoryGirl.create(:banner_image, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.banner_images_admin_banner_images_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.banner_images_admin_banner_images_path

            click_link "Add New Banner Image"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::BannerImages::BannerImage.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::BannerImages::BannerImage.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:banner_image, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.banner_images_admin_banner_images_path

              click_link "Add New Banner Image"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::BannerImages::BannerImage.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:banner_image, :name => "A name") }

          it "should succeed" do
            visit refinery.banner_images_admin_banner_images_path

            within ".actions" do
              click_link "Edit this banner image"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:banner_image, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.banner_images_admin_banner_images_path

            click_link "Remove this banner image forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::BannerImages::BannerImage.count.should == 0
          end
        end

      end
    end
  end
end
