require_relative '../../../spec_helper'

describe OCD::Util::Inflector do

  describe '#camelize' do

    context 'given a snake_case name with no options' do

      subject { OCD::Util::Inflector.camelize('snake_case') }

      it 'must return UpperCamelCase' do
        expect(subject).to eq('SnakeCase')
      end

    end

    context 'given a snake_case name with first_letter as true' do

      subject { OCD::Util::Inflector.camelize('snake_case', true) }

      it 'must return UpperCamelCase' do
        expect(subject).to eq('SnakeCase')
      end

    end

    context 'given a snake_case name with first_letter as false' do

      subject { OCD::Util::Inflector.camelize('snake_case', false) }

      it 'must return LpperCamelCase' do
        expect(subject).to eq('snakeCase')
      end

    end

  end

end
