require_relative '../../spec_helper'

describe OCD::Options do

  describe '#parse' do

    let(:options) { OCD::Options.new }

    it 'must return self' do
      expect(options.parse).to equal(options)
    end

  end

  context 'given valid options' do

    let(:options) {
      OCD::Options.new.tap do |obj|
        obj.parse(['--file=foo.yml'])
      end
    }

    it 'must respond by correct key symbol' do
      expect(options[:file]).to eq('foo.yml')
    end

    it 'must respond by correct key string' do
      expect(options['file']).to eq('foo.yml')
    end

    it 'must give me nil for invalid key' do
      expect(options[:key]).to be_nil
    end

    it 'must give me first non-nil option' do
      expect(options[:key, :file]).to eq('foo.yml')
    end

  end

  context 'given an empty option' do

    let(:options) {
      OCD::Options.new.tap do |obj|
        obj.parse(['--file'])
      end
    }

    it 'must set the value to true' do
      expect(options[:file]).to be_true
    end

  end

  context 'given a path as an option' do

    let(:options) {
      OCD::Options.new.tap do |obj|
        obj.parse(['./foo/'])
      end
    }

    it 'must set option as path' do
      expect(options[:path]).to eq(['./foo/'])
    end

  end

  context 'given multiple paths as an option' do

    let(:options) {
      OCD::Options.new.tap do |obj|
        obj.parse(['./foo/', './bar/'])
      end
    }

    it 'must set option as path' do
      expect(options[:path]).to eq(['./foo/', './bar/'])
    end

  end

  context 'given invalid options' do

    let(:options) {
      OCD::Options.new.tap do |obj|
        obj.parse(['foo'])
      end
    }

    it 'must ignore option' do
      expect{ options }.to_not raise_exception(Exception)
    end

  end

end
