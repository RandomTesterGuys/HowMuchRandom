#!/usr/bin/python

from __future__ import division

def calcolaStatisticaTest(dati):
    #Dividiamo l'intervallo [0,1] in k segmenti, e contiamo le occorrenze campionarie
    for j in range(len(dati)):  #rendiamo positivi i valori negativi
        dati[j]= abs(float(dati[j]))
    k = 101
    occorrenzeCampionarie = [0]*k

    for valore in dati:
        if float(valore) < 0: continue
        for i in range(k):
            
            if (i/k) <=  float(valore) < ((i+1)/k):
                occorrenzeCampionarie[i] += 1

    print "OCCORRENZE:"
    print occorrenzeCampionarie
    
    sum = 0
    n = len(dati)
    for i in range(k):
        sum += (occorrenzeCampionarie[i]**2)/(n*(1/k))
    sum -= n

    print "SUM:"
    print sum


if __name__ == "__main__":
    with open('./output.txt') as f:
        lines = f.read().splitlines()
    
    calcolaStatisticaTest(lines)

