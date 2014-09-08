require 'csv'
data = CSV.read('data.csv')
name = []
CSV.foreach('data.csv') {|row| name << row[0]}
score = []
CSV.foreach('data.csv') {|row| score << row[1]}
color = []
CSV.foreach('data.csv') {|row| color << row[2]}
scoreF = []
i = 1
max_score=0.0
temp=0.0
min_score=100.0

#find max score
while i < score.length
	scoreF[i]=score[i].to_f
	#puts scoreF[i]
	if scoreF[i]>max_score
		max_score=scoreF[i]
	end
  i += 1
end
puts "max =  #{max_score}"


#find min score
j=1
while j < score.length
	scoreF[j]=score[j].to_f
	#puts scoreF[i]
	if scoreF[j]<min_score
		min_score=scoreF[j]
	end
  j += 1
end
puts "min =  #{min_score}"

#find mean
mean=0.0
k=1
while k < score.length
	scoreF[k]=score[k].to_f
	mean+=scoreF[k]
	
	k +=1
end
mean = mean/(scoreF.length-1)
puts "mean =  #{mean}"

#find popular color
a=1
count=0
count2=0
while a<color.length
	for number in(1..color.length)
		if color[a].eql?color[number]
			count+=1
		end
	end
	puts "#{color[a]} got #{count} vote"
	if count>count2
		count2=count
		puts "#{color[a]}  got the most popular vote"
	end
	if count==1 || count==0
		puts "#{color[a]}  got the least popular vote"
	end
	count=0
	a+=1
end

#name
nameT = Array.new(name.length-1) { Array.new(3) }
b=0
c=1
while c<name.length
	nameT[b] = name[c].downcase.split(" ")
	b+=1
	c+=1
end
b=0
while b<name.length
	firstname = nameT[b][0].reverse
	if nameT[b][2]==nil
		lastname = lastname = nameT[b][1].reverse
		middlename = ""
	end
	if nameT[b][2]!=nil
		lastname = nameT[b][2].reverse
		middlename = nameT[b][1].insert(0," ")
	end
	l_firstname = firstname.slice!(0).upcase
	l_lastname = lastname.slice!(0).upcase
	name_final = firstname.reverse+l_firstname+middlename+lastname.reverse.insert(0," ")+l_lastname
	puts name_final
	b+=1
end
=begin
print "Enter you name "
name = gets.chomp.downcase.split(" ")
firstname = name[0].reverse
lastname = name[name.length].reverse
l_firstname = firstname.slice!(0).upcase
l_lastname = lastname.slice!(0).upcase
name = firstname.reverse+l_firstname+lastname.reverse.insert(0," ")+l_lastname
puts name
=end




