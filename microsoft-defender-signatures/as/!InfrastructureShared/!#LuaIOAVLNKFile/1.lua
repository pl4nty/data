local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = ""
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "Lua:LNK_Settings!HasArguments"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = "Args"
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "Lua:LNK_Settings!RunMinimized"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = L0_1
  L2_1 = "Min"
  L0_1 = L1_1 .. L2_1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "RPF:TopLevelFile"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:IOAVTopLevelLNKFile"
  L3_1 = L0_1
  L2_1 = L2_1 .. L3_1
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "//Lua:GIOAVTopLevelLNKFile"
  L3_1 = L0_1
  L2_1 = L2_1 .. L3_1
  L1_1(L2_1)
else
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "//Lua:GIOAVFirstLNKFile"
  L3_1 = L0_1
  L4_1 = "InContainer"
  L2_1 = L2_1 .. L3_1 .. L4_1
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:IOAVFirstLNKFile"
    L3_1 = L0_1
    L4_1 = "InContainer"
    L2_1 = L2_1 .. L3_1 .. L4_1
    L1_1(L2_1)
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "//Lua:GIOAVFirstLNKFile"
    L3_1 = L0_1
    L4_1 = "InContainer"
    L2_1 = L2_1 .. L3_1 .. L4_1
    L1_1(L2_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
