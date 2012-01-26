require 'bio'

module Bio
  class Sequence
    class AA
      # Return an array of hydrophobicities, as defined by Kyte and Doolittle
      def hydrophopathy_profile
        profile = []
        seq.each_char do |letter|
          profile.push Bio::AminoAcid::Data::KYTE_DOOLITTLE_HYDROPATHY_SCALE[letter]
        end
        profile
      end
      
      # Sum of hydropathy values for each amino acid, divided by the length of the protein
      def grand_average_of_hydropathy
        hydrophopathy_profile.inject{|sum,x| sum + x }.to_f/seq.length
      end
      alias_method :gravy, :grand_average_of_hydropathy
    end
  end
  
  
  class AminoAcid
    module Data
      # Jack Kyte, Russell F. Doolittle,
      # A simple method for displaying the hydropathic character of 
      # a protein, Journal of Molecular Biology,
      # Volume 157, Issue 1, 5 May 1982, Pages 105-132, ISSN 0022-2836, 10.1016/0022-2836(82)90515-0.
      KYTE_DOOLITTLE_HYDROPATHY_SCALE = {
        'A' => 1.8,
        'C' => 2.5,
        'D' => -3.5,
        'E' => -3.5,
        'F' => 2.8,
        'G' => -0.4,
        'H' => -3.2,
        'I' => 4.5,
        'K' => -3.9,
        'L' => 3.8,
        'M' => 1.9,
        'N' => -3.5,
        'P' => -1.6,
        'Q' => -3.5,
        'R' => -4.5,
        'S' => -0.8,
        'T' => -0.7,
        'U' => 0.0,
        'V' => 4.2,
        'W' => -0.9,
        'Y' => -1.3,
          
        'B' => -3.5,
        'X' => -0.49,
        'Z' => -3.5,
      }
    end
  end
end