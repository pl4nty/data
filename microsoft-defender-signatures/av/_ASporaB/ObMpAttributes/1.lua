local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "->(Ole"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = ".wsf"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "_pdf"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_54
    end
  end
end
L1_1 = headerpage
L1_1 = L1_1[1]
if L1_1 == 60 then
  L1_1 = headerpage
  L1_1 = L1_1[2]
  if L1_1 == 106 then
    L1_1 = headerpage
    L1_1 = L1_1[3]
    if L1_1 == 111 then
      L1_1 = headerpage
      L1_1 = L1_1[4]
      if L1_1 == 98 then
        L1_1 = headerpage
        L1_1 = L1_1[5]
        if L1_1 == 62 then
          L1_1 = mp
          L1_1 = L1_1.INFECTED
          return L1_1
        end
      end
    end
  end
end
::lbl_54::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
