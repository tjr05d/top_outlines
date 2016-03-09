namespace :top_outlines do
  desc "Recalculate the outline prices based on sales"
  task price_calc: :environment do
    puts "calculating outline prices..."
    Outline.price_calc
  end

end
