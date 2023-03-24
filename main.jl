using Shuffle
alphabet = "abcdefghijklmnopqrstuvwxyz"
length(alphabet)

r1 = shuffle(alphabet)
r2 = shuffle(alphabet)
r3 = shuffle(alphabet)


function rotor(text,r)
    res = ""
    splited_list  = split(text,"")
    for i in 1:length(splited_list)
        index = findfirst(x->x==splited_list[i],alphabet)
        res *= r[index]
    end
end
function ()
    
end





