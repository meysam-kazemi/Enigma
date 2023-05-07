import Shuffle , Random
Random.seed!(1234);

# q = Dict(a[i]=>b[i] for i in 1:length(a))

alphabet = "abcdefghigklmnopqrstuvwxyz"

rotor1 = join(Shuffle.shuffle(alphabet),"")
println(rotor1)

rotor2 = join(Shuffle.shuffle(alphabet),"")
println(rotor2)

rotor3 = join(Shuffle.shuffle(alphabet),"")
println(rotor3)



