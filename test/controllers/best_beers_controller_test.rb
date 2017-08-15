require 'test_helper'

class BestBeersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @best_beer = best_beers(:one)
  end

  test "should get index" do
    get best_beers_url
    assert_response :success
  end

  test "should get new" do
    get new_best_beer_url
    assert_response :success
  end

  test "should create best_beer" do
    assert_difference('BestBeer.count') do
      post best_beers_url, params: { best_beer: { alcohol: @best_beer.alcohol, beer: @best_beer.beer, beer_type: @best_beer.beer_type, points: @best_beer.points } }
    end

    assert_redirected_to best_beer_url(BestBeer.last)
  end

  test "should show best_beer" do
    get best_beer_url(@best_beer)
    assert_response :success
  end

  test "should get edit" do
    get edit_best_beer_url(@best_beer)
    assert_response :success
  end

  test "should update best_beer" do
    patch best_beer_url(@best_beer), params: { best_beer: { alcohol: @best_beer.alcohol, beer: @best_beer.beer, beer_type: @best_beer.beer_type, points: @best_beer.points } }
    assert_redirected_to best_beer_url(@best_beer)
  end

  test "should destroy best_beer" do
    assert_difference('BestBeer.count', -1) do
      delete best_beer_url(@best_beer)
    end

    assert_redirected_to best_beers_url
  end
end
