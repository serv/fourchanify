require "spec_helper"

describe Image do
  let(:board) { board_names_list.sample }
  let(:image) { get_images(board, get_first_thread_no(board)).first }
  let(:filename) { image.filename }
  let(:ext) { image.ext }
  let(:fsize) { image.fsize }
  let(:tim) { image.tim }
  let(:url) { image.get_url }

  before do
    @request = FactoryGirl.build(:image, :filename => filename, :ext => ext,
      :fsize => fsize, :tim => tim, :url => url)
  end
  subject { @request }

  it { should respond_to(:filename) }
  it { should respond_to(:ext) }
  it { should respond_to(:fsize) }
  it { should respond_to(:tim) }

  its(:filename) { should == filename }
  its(:ext) { should == ext }
  its(:fsize) { should == fsize }
  its(:tim) { should == tim }
end
