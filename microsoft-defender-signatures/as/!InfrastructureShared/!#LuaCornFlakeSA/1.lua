local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCRT:5351.CornFlake"
L0_1 = L0_1(L1_1)
L1_1 = #L0_1
if 3 <= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:CornFlake.BS1"
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
else
  L1_1 = #L0_1
  if L1_1 == 2 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:CornFlake.MS1"
    L1_1(L2_1)
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
