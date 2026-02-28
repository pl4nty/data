local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L2_1 = L0_1
L1_1 = L0_1.len
L1_1 = L1_1(L2_1)
if L1_1 < 24 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "(.+\\)([^\\]+)$"
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L1_1
L3_1 = L1_1.len
L3_1 = L3_1(L4_1)
if 20 < L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.len
  L3_1 = L3_1(L4_1)
  if 3 < L3_1 then
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L1_1
    L5_1 = -10
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 == "\\temp\\low\\" then
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L2_1
      L5_1 = -3
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 == ".js" then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "Lua:ContextJSFileInTempLow"
        L3_1(L4_1)
      else
        L3_1 = string
        L3_1 = L3_1.sub
        L4_1 = L2_1
        L5_1 = -4
        L3_1 = L3_1(L4_1, L5_1)
        if L3_1 == ".vbs" then
          L3_1 = mp
          L3_1 = L3_1.set_mpattribute
          L4_1 = "Lua:ContextVBSFileInTempLow"
          L3_1(L4_1)
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
