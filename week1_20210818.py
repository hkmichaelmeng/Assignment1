#Week 1 Test

# For file with only numbers, you should only return one thing(i.e.the first 10 characters)

# For file with story,you NEED to return two things(i.e. a modified string AND a list)
#  you can return multiple values by simply return them separated by commas like the following
# def editor(fname):
#
#     return 'modifystring', [a,b,c,d]

# HINT: to call your function for the story.txt file, use the following command
# editor("./data/story.txt")
# return statement should be in the format below
# return 'modifystring', [a,b,c,d]




import os


def editor(fname):
    
    with open(fname,'r') as f:
        text = f.read()

    if text.isdigit():
        return text[:10]
    else:
        t = text.split()
        s = set(t)
        l = [t.count(i) for i in s]
        l.sort(reverse = True)
        l1 = l[:5]
        
        word = []
        j = 0
        while j < len(l1):
            for w in t:
                if t.count(w) == l1[j]:
                    word.append(w)
            j += 1
            
        i = 0
        while i < len(t):
            t[i] = t[i].lower()
            if t[i] == "/n":
                t.remove(t[i])
            i += 1
            
        return " ".join(t), word

    
    #YOUR CODE STARTS HERE




















