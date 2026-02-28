local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L0_1["appmodule.exe"] = true
L0_1["kernel.exe"] = true
L0_1["microsofthost.exe"] = true
L0_1["network02.exe"] = true
L0_1["svchost.exe"] = true
L0_1["svchost.exe.exe"] = true
L0_1["syswow.exe"] = true
L0_1["uihost32.exe"] = true
L0_1["uihost64.exe"] = true
L0_1["window.exe"] = true
L0_1["wxm.exe"] = true
L1_1 = peattributes
L1_1 = L1_1.is_process
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1, L3_1, L4_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1)
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "(.+\\)([^\\]+)$"
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L3_1 ~= nil then
  L4_1 = L0_1[L3_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
