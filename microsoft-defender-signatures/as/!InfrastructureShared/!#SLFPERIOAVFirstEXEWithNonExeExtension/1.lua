local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.lower
  L1_1 = mp
  L1_1 = L1_1.getfilename
  L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1()
  L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
  L2_1 = L0_1
  L1_1 = L0_1.match
  L3_1 = "(.+\\)([^\\]+)$"
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L2_1
  L3_1 = L2_1.len
  L3_1 = L3_1(L4_1)
  if not (L3_1 < 4) then
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L2_1
    L5_1 = -4
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 == ".exe" then
      goto lbl_44
    end
  end
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = ".exe->"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "//GIOAVFirstEXEWithNonExeExtension"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
::lbl_44::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
