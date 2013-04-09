require_relative '../../../spec_helper'

describe OCD::Models::File do

  subject { OCD::Models::File.new(__FILE__) }

  describe '#where' do

    let(:paths) { [__FILE__] }
    let(:result) { OCD::Models::File.where(paths) }

    before do
      Dir.stub(:glob).and_return(paths)
      result
    end

    it 'must call glob' do
      expect(Dir).to have_received(:glob).with(paths)
    end

    it 'must overwrite paths with file objects' do
      expect(result.first).to be_a(OCD::Models::File)
    end

  end

  describe '.warnings?' do

    context 'given I have a warning' do

      before do
        subject.add_warning(rule: 'foo_rule')
      end

      it 'must return true' do
        expect(subject.warnings?).to be_true
      end

    end

    context 'given I have no warnings' do

      it 'must return false' do
        expect(subject.warnings?).to be_false
      end

    end

  end

  describe '.violations?' do

    context 'given I have a violation' do

      before do
        subject.add_violation(rule: 'foo_rule')
      end

      it 'must return true' do
        expect(subject.violations?).to be_true
      end

    end

    context 'given I have no violations' do

      it 'must return false' do
        expect(subject.violations?).to be_false
      end

    end

  end

  describe '.add_violation' do

    context 'given a set of options with only rule set' do

      context 'given I wish to retrieve violations' do

        before do
          subject.add_violation(rule: 'foo_rule')
        end

        it 'must be stored in accessible violations variable' do
          expect(subject.violations).to eq([
            message: 'Unknown error occured.',
            column: 0,
            line: 0,
            rule: 'foo_rule'
          ])
        end

      end

      it 'must let rule overwrite default' do
        expect(subject.add_violation(rule: 'foo_rule')).to eq([
          message: 'Unknown error occured.',
          column: 0,
          line: 0,
          rule: 'foo_rule'
        ])
      end

      it 'must let message overwrite default' do
        expect(subject.add_violation(message: 'foo message')).to eq([
          message: 'foo message',
          column: 0,
          line: 0,
          rule: 'Unknown'
        ])
      end

      it 'must let line overwrite default' do
        expect(subject.add_violation(line: 10)).to eq([
          message: 'Unknown error occured.',
          column: 0,
          line: 10,
          rule: 'Unknown'
        ])
      end

      it 'must let column overwrite default' do
        expect(subject.add_violation(column: 10)).to eq([
          message: 'Unknown error occured.',
          column: 10,
          line: 0,
          rule: 'Unknown'
        ])
      end

    end

  end

  describe '.add_warning' do

    context 'given a set of options with only rule set' do

      context 'given I wish to retrieve warnings' do

        before do
          subject.add_warning(rule: 'foo_rule')
        end

        it 'must be stored in accessible warnings variable' do
          expect(subject.warnings).to eq([
            message: 'Unknown error occured.',
            column: 0,
            line: 0,
            rule: 'foo_rule'
          ])
        end

      end

      it 'must let rule overwrite default' do
        expect(subject.add_warning(rule: 'foo_rule')).to eq([
          message: 'Unknown error occured.',
          column: 0,
          line: 0,
          rule: 'foo_rule'
        ])
      end

      it 'must let message overwrite default' do
        expect(subject.add_warning(message: 'foo message')).to eq([
          message: 'foo message',
          column: 0,
          line: 0,
          rule: 'Unknown'
        ])
      end

      it 'must let line overwrite default' do
        expect(subject.add_warning(line: 10)).to eq([
          message: 'Unknown error occured.',
          column: 0,
          line: 10,
          rule: 'Unknown'
        ])
      end

      it 'must let column overwrite default' do
        expect(subject.add_warning(column: 10)).to eq([
          message: 'Unknown error occured.',
          column: 10,
          line: 0,
          rule: 'Unknown'
        ])
      end

    end

  end

end
