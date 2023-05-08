alphabet = "abcdefghijklmnopqrstuvwxyz "
len_alphabet = alphabet |> length

rotors = read("rotors.enigma",String) # Read rotors
rotor1,rotor2,rotor3 = split(rotors,",")


# Reflector
reverse_alphabet = reverse(alphabet)
reflector = Dict(alphabet[i]=>reverse_alphabet[i] for i in 1:len_alphabet)

# Rotation function
function Rotate_rotor(rotor)
    return rotor[2:end] * rotor[1]
end

step = 1
function Enigma(text)
    global rotor1,rotor2,rotor3 , step
    res = ""
    for c in text
        c1 = rotor1[findfirst(c,alphabet)] # Apply the rotor1 to c(each character)
        c2 = rotor2[findfirst(c1,alphabet)] # Apply the rotor3 to c
        c3 = rotor3[findfirst(c2,alphabet)] # Apply the rotor2 to c
        reflect = reflector[c3] 
        ref_c3 = alphabet[findfirst(reflect,rotor3)]  # Apply the reverse of rotor3 to c
        ref_c2 = alphabet[findfirst(ref_c3,rotor2)] #  Apply the reverse of rotor2 to c
        ref_c1 = alphabet[findfirst(ref_c2,rotor1)] #  Apply the reverse of rotor1 to c
        res = res * ref_c1 # Add the obtained characet to res
        rotor1 = Rotate_rotor(rotor1)
        if (step % len_alphabet) == 0 
            rotor2 = Rotate_rotor(rotor2)
        elseif (step % len_alphabet^2) == 0
            rotor3 = Rotate_rotor(rotor3)
        end
        step += 1
    end
    return res
end


t = Enigma("meysam kazemi")
println(t)

