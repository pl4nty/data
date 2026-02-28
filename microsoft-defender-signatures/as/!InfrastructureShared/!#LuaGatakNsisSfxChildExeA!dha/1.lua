local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SCRIPT:GatakNsisInstData"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if L0_1 < 3000 or 4000 < L0_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "//GatakNsisInstData"
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "//GatakNsisInstData"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.lower
  L1_1 = mp
  L1_1 = L1_1.getfilename
  L1_1, L2_1, L3_1 = L1_1()
  L0_1 = L0_1(L1_1, L2_1, L3_1)
  if L0_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "%(nsis%-6%-%d+%.exe%)$"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "%(nsis%-6%-install%d+%.exe%)$"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "%(nsis%-6%-setup%d+%.exe%)$"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
