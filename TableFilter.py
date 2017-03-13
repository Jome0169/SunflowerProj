import os 


Location = os.getcwd()



def Tablereader(Table):
    with open(Table,'r') as f:
        for line in f:
            if line.startswith('transcript_id'):
                pass
            else:
                x = line.strip('\n').split('\t')
                pretty = map(float,x[1:20])
                Sums = sum(pretty)
                if Sums >= 1 : 
                    with open("TrimmedIsoforms.txt", 'a') as c:
                        c.write(line)



for itme in os.listdir(Location):
    if itme == "TotalIsoforms.txt":
        Tablereader(itme)

















