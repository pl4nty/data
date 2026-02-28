local L0_1, L1_1, L2_1, L3_1
L0_1 = peattributes
L0_1 = L0_1.isdriver
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "BM_DEVICE_DRIVER"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "ESRP:PEStatic:asio.sys"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "ESRP:PEStatic:asio3.sys"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = pe
L0_1 = L0_1.get_fixedversioninfo
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "BM_ESRP:Lua:AsusVulDriverNoVerInfoFound"
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
else
  L1_1 = L0_1.FileVersion
  if L1_1 ~= nil then
    L2_1 = type
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 == "number" then
      goto lbl_59
    end
  end
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "BM_ESRP:Lua:AsusVulDriverNoVerNumFound"
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  do return L2_1 end
  ::lbl_59::
  if L1_1 <= 281483568218112 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "BM_ESRP:Lua:AsusVulDriverFound"
    L2_1(L3_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
