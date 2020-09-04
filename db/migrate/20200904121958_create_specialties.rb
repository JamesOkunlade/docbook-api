class CreateSpecialties < ActiveRecord::Migration[6.0]
  def change
    create_table :specialties do |t|
      t.string :area_of_specialization

      t.timestamps
    end
  end
end
