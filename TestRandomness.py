#!/usr/bin/python

from __future__ import division

def calcolaStatisticaTest(dati):
    #Dividiamo l'intervallo [0,1] in k segmenti, e contiamo le occorrenze campionarie
    
    k = 5
    occorrenzeCampionarie = [0]*k

    for valore in dati:
        print "Valore: " + valore

        for n in range(k):
            print n/k
            print (n+1)/k
            
            if (valore >= (n/k) and  valore < ((n+1)/k)):
                occorrenzeCampionarie[n] = occorenzeCampionarie[n] +1

    print dati
    print occorrenzeCampionarie

if __name__ == "__main__":
    with open('./test.txt') as f:
        lines = f.read().splitlines()
    
    calcolaStatisticaTest(lines)

