-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/VulAsusDriverForASR.A
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

if not peattributes.isdriver and not mp.get_mpattribute("BM_DEVICE_DRIVER") then
  return mp.CLEAN
end
if not mp.get_mpattribute("ESRP:PEStatic:asio.sys") and not mp.get_mpattribute("ESRP:PEStatic:asio3.sys") then
  return mp.CLEAN
end
local l_0_0 = pe.get_fixedversioninfo()
if l_0_0 == nil or l_0_0 == "" then
  mp.set_mpattribute("BM_ESRP:Lua:AsusVulDriverNoVerInfoFound")
  return mp.INFECTED
else
  local l_0_1 = l_0_0.FileVersion
  if l_0_1 == nil or type(l_0_1) ~= "number" then
    mp.set_mpattribute("BM_ESRP:Lua:AsusVulDriverNoVerNumFound")
    return mp.INFECTED
  end
  if l_0_1 <= 281483568218112 then
    mp.set_mpattribute("BM_ESRP:Lua:AsusVulDriverFound")
    return mp.INFECTED
  end
end
return mp.CLEAN
