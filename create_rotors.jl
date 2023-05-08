import Shuffle , Random
Random.seed!(1234);


alphabet = "abcdefghigklmnopqrstuvwxyz "

rotor1 = join(Shuffle.shuffle(alphabet),"")

rotor2 = join(Shuffle.shuffle(alphabet),"")

rotor3 = join(Shuffle.shuffle(alphabet),"")

file = open("rotors.enigma","w")
text = join([rotor1,rotor2,rotor3],",")
write(file,text)
close(file)



