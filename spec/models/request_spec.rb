require "spec_helper"

describe Request do
  let(:board) { board_names_list.sample }
  let(:thread_id) { get_first_thread_no(board) }
  let(:image_count) { get_image_count(board, thread_id) }
  let(:images) { get_images(board, thread_id) }

  before do
    @request = FactoryGirl.build(:request, :board => board,
      :thread_id => thread_id, :image_count => image_count, :images => images)
  end
  subject { @request }

  it { should respond_to(:board) }
  it { should respond_to(:thread_id) }
  it { should respond_to(:image_count) }
  it { should respond_to(:url) }
  it { should respond_to(:images) }

  its(:board) { should == board }
  its(:thread_id) { should == thread_id }
  its(:image_count) { should == image_count }
  its(:images) { should == images }
end