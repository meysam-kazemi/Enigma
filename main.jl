alphabet = "abcdefghijklmnopqrstuvwxyz"

rotors = read("rotors.enigma",String)
rotor1,rotor2,rotor3 = split(rotors,",")

rotor1 = Dict(alphabet[i]=>rotor1[i] for i in 1:length(alphabet))
rotor2 = Dict(alphabet[i]=>rotor2[i] for i in 1:length(alphabet))
rotor3 = Dict(alphabet[i]=>rotor3[i] for i in 1:length(alphabet))


function rotor(t,r) # apply rotor
    index = findfirst(t,alphabet)
    return r[index]
end

function rotor!(t,r) # inverse rotor
    index = findfirst(t,r)
    return alphabet[index]
end

function enigma(text,r1,r2,r3)
    res = ""
    for t in text
        character = rotor(t,r1)
        character = rotor(character,r2)
        character = rotor(character,r3)
        index = findfirst(character,alphabet) # inverse
        character = alphabet[end-index+1]
        character = rotor!(character,r3)
        character = rotor!(character,r2)
        character = rotor!(character,r1)
        res *= character
    end
    return res
end


function test()
    println("ab  :  $alphabet")
    println("r1  :  $r1")
    println("r2  :  $r2")
    println("r3  :  $r3")
end

test()
t = enigma("helloworld",r1,r2,r3)
println(t)

println(enigma(t,r1,r2,r3))

