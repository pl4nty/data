local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.packed
if not L0_1 then
  L0_1 = pehdr
  L0_1 = L0_1.NumberOfSections
  if 4 < L0_1 then
    L0_1 = pesecs
    L0_1 = L0_1[4]
    L0_1 = L0_1.Name
    if L0_1 == ".bss" then
      L0_1 = pesecs
      L0_1 = L0_1[5]
      L0_1 = L0_1.Name
      if L0_1 == ".idata" then
        goto lbl_29
      end
    end
  end
  L0_1 = pesecs
  L0_1 = L0_1[5]
  L0_1 = L0_1.Name
  if L0_1 ~= ".bss" then
    goto lbl_32
  end
  L0_1 = pesecs
  L0_1 = L0_1[6]
  L0_1 = L0_1.Name
  if L0_1 ~= ".idata" then
    goto lbl_32
  end
end
::lbl_29::
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_32::
L0_1 = mp
L0_1 = L0_1.changedetectionname
L1_1 = 805306391
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
