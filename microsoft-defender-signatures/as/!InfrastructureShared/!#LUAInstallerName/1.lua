local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 == nil then
  L1_1 = #L0_1
  if L1_1 < 5 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "setup"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "install"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "x32"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L2_1 = L0_1
      L1_1 = L0_1.find
      L3_1 = "x64"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        goto lbl_47
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.set_mpattribute
L2_1 = "Lua:SetupName"
L1_1(L2_1)
::lbl_47::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
