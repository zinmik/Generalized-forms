from sage.quadratic_forms.genera.normal_form import p_adic_normal_form
#Computation of the 2-adic normal form
listNF = []
for A1 in range(0,8):
    A2 = (8-A1)%4
    for C1 in range(0,8):
        C2 = (8-C1)%4
        for a2 in range(0,2):
            for c2 in range(0,2):
                for B1 in range(0,8):
                    for B2 in range(0,4):
                        if (B1-B2)%2==0:
                            for E1 in range(0,4):
                                for E2 in range(0,4):
                                    if (E1-E2)%2==0:
                                        M = matrix([[A1,4*a2,B1,2*E1],[4*a2,2*A2,2*E2,2*B2],[B1,2*E2,C1,4*c2],[2*E1,2*B2,4*c2,2*C2]])
                                        NF, U = p_adic_normal_form(M,2)    #matrix NF is the normal form of M, U is the transformation
                                        NF = NF.change_ring(IntegerModRing(8))    #reduce NF mod 8
                                        listNF.append(NF)
#listNF now contains the normal forms mod 8 of the matrices M
listL = [
    [1,2,2,0,0,0],
    [1,2,8,0,0,0],
    [2,2,4,0,0,0],
    [2,3,3,2,0,0],
    [1,2,10,0,0,0],
    [2,2,5,0,0,0],
    [2,2,4,0,0,0],
    [2,4,5,4,0,0],
    [2,3,6,0,0,0],
    [2,3,8,0,0,0],
    [2,4,6,0,0,0],
    [2,5,5,2,0,0],
    [2,3,9,2,0,0],
    [2,5,6,4,0,0],
    [2,4,8,0,0,0],
    [2,5,7,2,0,0],
    [2,4,10,0,0,0],
    [2,4,11,4,0,0],
    [2,5,8,0,0,0],
    [2,4,12,0,0,0],
    [2,4,13,4,0,0],
    [2,5,10,0,0,0],
    [2,4,14,0,0,0]
]
#check whether the normal form of the matrix of 1+L modulo 8 is on listNF
for L in listL:
    MQ = matrix([[1,0,0,0],[0,L[0],L[5]/2,L[4]/2],[0,L[5]/2,L[1],L[3]/2],[0,L[4]/2,L[3]/2,L[2]]])   #construct the matrix of 1+L
    NF, U = p_adic_normal_form(MQ,2)   #matrix NF is the normal form of MQ, U is the transformation
    NF = NF.change_ring(IntegerModRing(8))   #reduce the normal form mod 8
    if listNF.count(NF)>0:
        print(L)