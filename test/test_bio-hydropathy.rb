require 'helper'

class TestBioBioGravy < Test::Unit::TestCase
  should "hydrophobicity" do
    assert_equal [1.8, 2.5, -3.5], Bio::Sequence::AA.new('ACD').hydrophopathy_profile
  end
  
  should "gravy" do 
    assert_equal -4, (Bio::Sequence::AA.new('ACDCD').grand_average_of_hydropathy*100).to_i
    assert_equal -4, (Bio::Sequence::AA.new('ACDCD').gravy*100).to_i
  end
end
