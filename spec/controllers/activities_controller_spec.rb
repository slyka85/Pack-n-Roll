describe ActivitiesController do
  let(:trip) { create(:trip) }
  let(:user) { trip.user }

  before { sign_in(user) }

  describe 'GET #new' do
    before { get :new, trip_id: trip.id }

    it { should respond_with(:success) }
  end

  describe 'POST #create' do
    context 'with one item' do
      before { post :create, trip_id: trip.id, activities: ['Hiking'] }

      it { should redirect_to(trip) }
      it { expect(trip.activities.count).to eq(1) }
    end
  end
end
