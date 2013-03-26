require 'test_helper'

class ReactionsControllerTest < ActionController::TestCase
  setup do
    @reaction = reactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reaction" do
    assert_difference('Reaction.count') do
      post :create, reaction: { conditions: @reaction.conditions, doi: @reaction.doi, name: @reaction.name, products: @reaction.products, reactionTransform: @reaction.reactionTransform, synCount: @reaction.synCount, user: @reaction.user }
    end

    assert_redirected_to reaction_path(assigns(:reaction))
  end

  test "should show reaction" do
    get :show, id: @reaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reaction
    assert_response :success
  end

  test "should update reaction" do
    put :update, id: @reaction, reaction: { conditions: @reaction.conditions, doi: @reaction.doi, name: @reaction.name, products: @reaction.products, reactionTransform: @reaction.reactionTransform, synCount: @reaction.synCount, user: @reaction.user }
    assert_redirected_to reaction_path(assigns(:reaction))
  end

  test "should destroy reaction" do
    assert_difference('Reaction.count', -1) do
      delete :destroy, id: @reaction
    end

    assert_redirected_to reactions_path
  end
end
