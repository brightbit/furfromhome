require 'test_helper'

class PetsControllerTest < ActionController::TestCase
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post :create, pet: { age: @pet.age, breed_id: @pet.breed_id, chipped: @pet.chipped, collar: @pet.collar, collar_description: @pet.collar_description, color: @pet.color, description: @pet.description, gender: @pet.gender, injured: @pet.injured, latitude: @pet.latitude, listing_type: @pet.listing_type, location: @pet.location, longitude: @pet.longitude, markings: @pet.markings, missing_since_found_at: @pet.missing_since_found_at, name: @pet.name, returned_to_owner: @pet.returned_to_owner, scraped_feed: @pet.scraped_feed, scraping_script: @pet.scraping_script, source_url: @pet.source_url, user_id: @pet.user_id, weight: @pet.weight }
    end

    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should show pet" do
    get :show, id: @pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet
    assert_response :success
  end

  test "should update pet" do
    patch :update, id: @pet, pet: { age: @pet.age, breed_id: @pet.breed_id, chipped: @pet.chipped, collar: @pet.collar, collar_description: @pet.collar_description, color: @pet.color, description: @pet.description, gender: @pet.gender, injured: @pet.injured, latitude: @pet.latitude, listing_type: @pet.listing_type, location: @pet.location, longitude: @pet.longitude, markings: @pet.markings, missing_since_found_at: @pet.missing_since_found_at, name: @pet.name, returned_to_owner: @pet.returned_to_owner, scraped_feed: @pet.scraped_feed, scraping_script: @pet.scraping_script, source_url: @pet.source_url, user_id: @pet.user_id, weight: @pet.weight }
    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete :destroy, id: @pet
    end

    assert_redirected_to pets_path
  end
end
