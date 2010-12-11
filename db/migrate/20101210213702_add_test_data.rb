class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Product.create( :title => 'Flor de Selva 15',
                    :description =>
                    %w{Maya Selva Cigares 15 år!
                    Handrullad Torpedo Längd: 20 x 140 mm},
                    :image_url => '/images/Flor-de-Selva-No15_01-Liten.jpg',
                    :price => 102
    )
  end

  def self.down
    Product.delete_all
  end
end
