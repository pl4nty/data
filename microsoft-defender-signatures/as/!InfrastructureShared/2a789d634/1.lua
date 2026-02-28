local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 == 147456 then
  L0_1 = pehdr
  L0_1 = L0_1.NumberOfSections
  if L0_1 == 5 then
    L0_1 = pesecs
    L0_1 = L0_1[3]
    L0_1 = L0_1.VirtualSize
    if L0_1 ~= 104608 then
      L0_1 = pesecs
      L0_1 = L0_1[3]
      L0_1 = L0_1.VirtualSize
      if L0_1 ~= 104672 then
        goto lbl_38
      end
    end
    L0_1 = pesecs
    L0_1 = L0_1[4]
    L0_1 = L0_1.VirtualSize
    if L0_1 == 26488 then
      L0_1 = pesecs
      L0_1 = L0_1[2]
      L0_1 = L0_1.VirtualSize
      if 33024 < L0_1 then
        L0_1 = pesecs
        L0_1 = L0_1[2]
        L0_1 = L0_1.VirtualSize
        if L0_1 < 33280 then
          L0_1 = mp
          L0_1 = L0_1.INFECTED
          return L0_1
        end
      end
    end
  end
end
::lbl_38::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
