    require('open-uri')
    require('json')
 
class HomeController < ApplicationController
    def index
        #45개의 숫자에서 6개를 뽑는다.
        numbers = (1..45).to_a
        random_numbers = numbers.sample 6
        @lucky_numbers = random_numbers.sort
    end
    
    def answer
    numbers = (1..45).to_a
    random_numbers = numbers.sample 6 
    @lucky_numbers = random_numbers.sort
    
    @lotto_hash = JSON.parse(open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=801').read)
    # 정답인 로또넘버
    @answer = []
    @lotto_hash.each do |k, v|
        if k.include?("drwtNo")
        @answer << v
        end
        end
    @answer.sort!
    
    @bonus = []
    @lotto_hash.each do|k,v|
    if k.include?("bnusNo")
    @bonus << v
    end
    end
    
    # @date =[]
    # @lotto_hash.each do|k,v|
    # if k.include?("drwNoDate")
    # @date << v
    # end
    # end

    @time = []
    @lotto_hash.each do|k,v|
    if k.include?("drwNo")
    @time << v
    end
    end 
    
    @array = []
    @answer.each do |n|
    if @lucky_numbers.include?(n)
    @array << n
    end
    end 
    
   
    end
end


