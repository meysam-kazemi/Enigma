using Shuffle
alphabet = "abcdefghijklmnopqrstuvwxyz"
length(alphabet)

r1 = shuffle(alphabet)
r2 = shuffle(alphabet)
r3 = shuffle(alphabet)


function rotor(text,r)
    res = ""
    splited_list  = split(text,"")
    for i in splited_list
        index = findfirst(i,alphabet)
        res *= r[index]
    end
    return res
end

function rotor!(text,r)
    res = ""
    splited_list  = split(text,"")
    for i in splited_list
        index = findfirst(i,r)
        res *= alphabet[index]
    end
    return res
end

function step1(text)
    t1 = rotor(text,r1)
    t2 = rotor(t1,r2)
    t3 = rotor(t2,r3)
    return t3
end
function inverse(text)
    res = ""
    splited_list  = split(text,"")
    for i in splited_list
        index = findfirst(i,alphabet)
        res *= alphabet[end-index+1]
    end
    return res
end

function step2(text)
    t1 = rotor!(text,r1)
    t2 = rotor!(t1,r2)
    t3 = rotor!(t2,r3)
    return t3
end




