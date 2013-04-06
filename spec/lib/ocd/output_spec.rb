require_relative '../../spec_helper'

describe OCD::Output do

  describe '#adapter' do

    it 'must return Cli adapter object' do
      expect(OCD::Output.adapter(:json)).to be_a(OCD::OutputAdapters::Cli)
    end

  end

  describe '.update' do

    subject{ OCD::Output.new }

    it 'must must throw UnimplementedMethod' do
      expect{ subject.update(:warning, {}) }.to raise_exception(OCD::UnimplementedMethod)
    end

  end

end
