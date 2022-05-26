
class Hastane_Ilac
    attr_reader :barcodeNumber, :medicineName, :medicineType, :medicineCompany, :stock, :medicineUnit
    
    def initialize(barcodeNumber, medicineName, medicineType, medicineCompany, stock, medicineUnit)
      @barcodeNumber = barcodeNumber
      @medicineName  = medicineName
      @medicineType = medicineType
      @medicineCompany = medicineCompany
      @stock = stock
      @medicineUnit = medicineUnit
    end
end

puts "Ondokuz Mayıs Üniversitesi Tıp Fakültesi Hastane Bilgi Sistemine Hoşgeldiniz"

medicines = Array.new

def Listing(medicines)
    stocks = 0
    type = 0
    medicines.each do |item|
        puts "****************************************"
        puts "Barkod No:        #{item.barcodeNumber}" 
        puts "Ilaç İsmi:        #{item.medicineName}"
        puts "Ilaç Türü:        #{item.medicineType}"
        puts "Üretici Firma:    #{item.medicineCompany}"
        puts "İlaç Stoğu:       #{item.stock}"
        puts "Ait Olduğu Birim: #{item.medicineUnit}"
        stocks  = stocks + item.stock
    end
    puts "****************************************"
    puts "Tüm Ilaçların (Tür farketmeksizin) Toplamı: #{stocks}"
end

def TotalMedicine(medicines)
    puts "Ilaç Türü Sayısı: #{medicines.count}"
end

def Addd(medicines) 
    print "Ilacın Barkod Numarası: "
    barcodeNumber = gets.to_i
    print "Ilacın Ismi: "
    medicineName = gets.to_s
    print "Ilacın Tipi: "
    medicineType = gets.to_s
    print "Ilacı Ureten Firma: "
    medicineCompany = gets.to_s
    print "Ilacın Stok Sayısı: "   
    stock = gets.to_i
    print "Ilacın Ait Olduğu Birim: "
    medicineUnit = gets.to_s

    medicine = Hastane_Ilac.new(barcodeNumber, medicineName, medicineType, medicineCompany, stock, medicineUnit)

    medicines.push(medicine)
end

def Exits()
    puts "Güle Güle"
end

def Main(medicines)
    print "Komut Giriniz: "
    komut = gets.chomp

    if komut == "EKLE"
        Addd(medicines)
        Main(medicines)
    elsif komut == "LISTELE"
        Listing(medicines)
        TotalMedicine(medicines)
        Main(medicines)
    elsif komut == "CIKIS"
        Exits()
    else
        puts "Hatalı Bir Komut Girdiniz"
        Main(medicines)
    end
end

Main(medicines)