require_relative '../../spec_helper'

describe OCD::Runner do

  describe '#main' do

    let(:output) { OCD::Output.adapter('cli') }

    before do
      output.stub(:notify).and_return(true)
      OCD::Output.stub(:adapter).and_return(output)
    end

    context 'given a suite and no files' do

      before do
        YAML.stub(:load_file).and_return([
          suite: 'Foo',
          paths: ['**/*.foo'],
          rules: []
        ])
        OCD::Runner.main(config: 'example.yml')
      end

      it 'must notify output of each start of the suite' do
        expect(output).to have_received(:notify).with(:suite, 'Foo')
      end

      it 'must notify output at the end of the suite' do
        expect(output).to have_received(:notify).with(:eos, 'Foo')
      end

    end

    context 'given a suite with a single file and a single rule' do

      let(:rules) { ['rule1.rb'] }
      let(:files) { ['file2.rb'] }

      before do
        YAML.stub(:load_file).and_return([
          suite: 'Foo',
          paths: ['**/*.foo'],
          rules: []
        ])
        rules[0].stub(:apply).and_return(true)
        OCD::Models::Rule.stub(:where).and_return(rules)
        OCD::Models::File.stub(:where).and_return(files)
        OCD::Runner.main(config: 'example.yml')
      end

      it 'must pass file to rule' do
        expect(rules[0]).to have_received(:apply).with('file2.rb')
      end

      it 'must notify output of a file' do
        expect(output).to have_received(:notify).with(:file, 'file2.rb')
      end

    end

  end

end
