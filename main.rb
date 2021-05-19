require_relative 'csv_calc'

class Main
  def self.init_file
    puts 'Введите имя файла:'
    filepath = gets.chomp
    CSVcalc.new(filepath)
  end

  def self.selected_column(data, cols)
    count = 1
    (0..cols).each do |i|
      puts "#{count}"'. '"#{(data[0][i])}"
      count += 1
    end
    gets.chomp.to_i
  end

  def self.data_formatting(csv, col)
    buffer = []
    (1..csv.rows).each do |i|
      buffer[i - 1] = csv.data[i][col].to_f
    end
    buffer
  end

  def self.choise(csv, array)
    exitcon = 0
    while exitcon.zero?
      choice = gets.chomp.to_i
      case choice
      when 1
        puts 'минимум = '"#{csv.min(array)}"
      when 2
        puts 'макимум = '"#{csv.max(array)}"
      when 3
        puts 'среднее значение = '"#{csv.mean(array)}"
      when 4
        puts 'исправленную выборочную дисперсию = '"#{csv.sample_variance(array)}"
      when 5
        exitcon = 1
      end
    end
  end

  def self.print_choise(csv, array)
    puts 'Выберите что вывести:'
    puts '1 - минимум'
    puts '2 - макимум'
    puts '3 - среднее значение'
    puts '4 - исправленную выборочную дисперсию'
    puts '5 - выход'
    choise(csv, array)
  end

  def self.start
    csv = init_file
    puts 'Введите столбец для вычисления'
    col = selected_column(csv.data, csv.cols) - 1
    array = data_formatting(csv, col)
    print_choise(csv, array)
  end
end

Main.start
