require_relative '../../../../spec_helper'

describe OCD::Rules::Basic::LineLengthRule do

  describe '.apply' do

    subject {
      OCD::Rules::Basic::LineLengthRule.new.tap do |obj|
        obj.config = {
          soft_line_limit: 100,
          hard_line_limit: 120,
        }
      end
    }

    let (:file) {
      OCD::Models::File.new(Tempfile.new('foo').path, 'r+')
    }

    before do
      file.stub(:add_violation).and_return(true)
      file.stub(:add_warning).and_return(true)
    end

    context 'given I have a file with a 100 char length line' do

      before do
        file.tap do |obj|
          100.times { obj.write(" ") }
          obj.write("\n")
          obj.rewind
        end
        subject.apply(file)
      end

      it 'must not throw a warning' do
        expect(file).to_not have_received(:add_warning)
      end

      it 'must not throw a violation' do
        expect(file).to_not have_received(:add_violation)
      end

    end

    context 'given I have a file with a 120 char length line' do

      before do
        file.tap do |obj|
          120.times { obj.write(" ") }
          obj.write("\n")
          obj.rewind
        end
        subject.apply(file)
      end

      it 'must throw a warning' do
        expect(file).to have_received(:add_warning)
      end

      it 'must not throw a violation' do
        expect(file).to_not have_received(:add_violation)
      end

    end

    context 'given I have a file with a 140 char length line' do

      before do
        file.tap do |obj|
          140.times { obj.write(" ") }
          obj.write("\n")
          obj.rewind
        end
        subject.apply(file)
      end

      it 'must not throw a warning' do
        expect(file).to_not have_received(:add_warning)
      end

      it 'must throw a violation' do
        expect(file).to have_received(:add_violation)
      end

    end

  end

end
