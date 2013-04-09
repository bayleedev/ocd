require_relative '../../../spec_helper'

describe OCD::Models::Rule do

  describe '#where' do
  end

  describe '.config=' do

    let(:config) { {foo: :bar} }

    before do
      subject.config = config
    end

    it 'must set config' do
      expect(subject.config).to equal(config)
    end

  end

  describe '.enabled' do

    it 'must return true' do
      expect(subject.enabled).to be_true
    end

  end

  describe '.apply' do

    it 'must throw exception' do
      expect{ subject.apply(:foo) }.to raise_exception(OCD::RuleNotImplemented)
    end

  end

end
