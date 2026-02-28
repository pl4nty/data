local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 15000000 then
  L0_1 = hstrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.ImageBase
  L1_1 = 128 + L1_1
  if L0_1 ~= L1_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.VA
    L1_1 = pehdr
    L1_1 = L1_1.ImageBase
    L1_1 = 128 + L1_1
    if L0_1 ~= L1_1 then
      L0_1 = hstrlog
      L0_1 = L0_1[3]
      L0_1 = L0_1.VA
      L1_1 = pehdr
      L1_1 = L1_1.ImageBase
      L1_1 = 128 + L1_1
      if L0_1 ~= L1_1 then
        L0_1 = hstrlog
        L0_1 = L0_1[4]
        L0_1 = L0_1.VA
        L1_1 = pehdr
        L1_1 = L1_1.ImageBase
        L1_1 = 128 + L1_1
        if L0_1 ~= L1_1 then
          goto lbl_41
        end
      end
    end
  end
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
::lbl_41::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
