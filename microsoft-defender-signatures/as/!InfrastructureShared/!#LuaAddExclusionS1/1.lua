local L0_1, L1_1, L2_1
L0_1 = 0
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:Exclusive.Programfilesx86.S01"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:Exclusive.Programfilesx86.S02"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCPT:BAT/BatLoader.B3"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_22
  end
end
L0_1 = L0_1 + 1
::lbl_22::
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:Exclusive.programdata.S01"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:Exclusive.programdata.S02"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:Exclusive.EdgeExtension.S01"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:Exclusive.EdgeExtension.S02"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:Exclusive.TempA.S01"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:Exclusive.TempA.S02"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:Exclusive.TempB.S01"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:Exclusive.TempB.S02"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
if 3 <= L0_1 and L0_1 < 100 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
