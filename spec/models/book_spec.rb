require 'rails_helper'

RSpec.describe Book, type: :model do
    describe 'associations' do
      it { should belong_to(:slug) }
    end
  
    describe 'validations' do
        before { create(:book) } # Isso cria um livro com valores padrão
      
        it { should validate_uniqueness_of(:title) }
        it { should validate_presence_of(:uri) }
      end  
  end
  