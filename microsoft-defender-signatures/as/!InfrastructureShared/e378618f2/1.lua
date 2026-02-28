local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if not (L0_1 < 65536) then
  L0_1 = pehdr
  L0_1 = L0_1.NumberOfSections
  if L0_1 == 4 then
    goto lbl_13
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_13::
L0_1 = pesecs
L0_1 = L0_1[4]
L0_1 = L0_1.Name
if L0_1 == ".rsrc" then
  L0_1 = pesecs
  L0_1 = L0_1[4]
  L0_1 = L0_1.SizeOfRawData
  if 32768 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.HSTR_WEIGHT
    if 2 <= L0_1 then
      L0_1 = mp
      L0_1 = L0_1.SUSPICIOUS
      return L0_1
    end
    L0_1 = hstrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.matched
    if not L0_1 then
      L0_1 = hstrlog
      L0_1 = L0_1[2]
      L0_1 = L0_1.matched
      if not L0_1 then
        goto lbl_43
      end
    end
    L0_1 = mp
    L0_1 = L0_1.LOWFI
    return L0_1
  end
end
::lbl_43::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
