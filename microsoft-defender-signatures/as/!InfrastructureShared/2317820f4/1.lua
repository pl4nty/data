local L0_1, L1_1, L2_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if not (L0_1 <= 6) then
  L0_1 = pehdr
  L0_1 = L0_1.NumberOfSections
  if not (9 <= L0_1) then
    goto lbl_12
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_12::
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.PointerToRawData
L1_1 = pesecs
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.SizeOfRawData
L0_1 = L0_1 + L1_1
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if not (L0_1 > L1_1) then
  L0_1 = peattributes
  L0_1 = L0_1.no_imports
  if L0_1 ~= true then
    goto lbl_36
  end
end
L0_1 = mp
L0_1 = L0_1.changedetectionname
L1_1 = 805306401
L0_1(L1_1)
::lbl_36::
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 10000 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if L0_1 < 280000 then
    L0_1 = pesecs
    L0_1 = L0_1[2]
    L0_1 = L0_1.VirtualAddress
    if L0_1 ~= 24576 then
      L0_1 = pesecs
      L0_1 = L0_1[2]
      L0_1 = L0_1.VirtualAddress
      if L0_1 ~= 20480 then
        L0_1 = pesecs
        L0_1 = L0_1[2]
        L0_1 = L0_1.VirtualAddress
        if L0_1 ~= 16384 then
          goto lbl_64
        end
      end
    end
    L0_1 = mp
    L0_1 = L0_1.SUSPICIOUS
    return L0_1
  end
end
::lbl_64::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
