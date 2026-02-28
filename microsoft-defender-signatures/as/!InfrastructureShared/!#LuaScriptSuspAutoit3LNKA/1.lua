local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:LnkTargetFnameExt!bat"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:LnkTargetFnameExt!scr"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Lua:LnkTargetFnameExt!pif"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "Lua:LnkTargetFnameExt!com"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.CLEAN
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.GetLnkInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.BasePath
if L1_1 ~= nil then
  L2_1 = #L1_1
  if 1 < L2_1 then
    L2_1 = IsKeyInRollingQueue
    L3_1 = "RenamedAutoitPath"
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L1_1
    L4_1 = L4_1(L5_1)
    L5_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
