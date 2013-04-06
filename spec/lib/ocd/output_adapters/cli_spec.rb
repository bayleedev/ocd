require_relative '../../../spec_helper'

describe OCD::OutputAdapters::Cli do

  describe '.update' do

    subject { OCD::OutputAdapters::Cli.new }

    before do
      subject.stub(:write).and_return(false)
      subject.update(:warning, {})
    end

    it 'must call write' do
      expect(subject).to have_received(:write)
    end

  end

end
