-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanWin32VulAsusDriverF\1.luac 

-- params : ...
-- function num : 0
if not peattributes.isdriver and not (mp.get_mpattribute)("BM_DEVICE_DRIVER") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("BM_ESRP:Hstr:AsusGio") and not (mp.get_mpattribute)("BM_ESRP:Hstr:asio2") then
  return mp.CLEAN
end
local l_0_0 = (pe.get_fixedversioninfo)()
if l_0_0 == nil or l_0_0 == "" then
  (mp.set_mpattribute)("BM_ESRP:Lua:AsusVulDriverNoVerInfoFound")
  return mp.INFECTED
else
  local l_0_1 = l_0_0.FileVersion
  if l_0_1 == nil or type(l_0_1) ~= "number" then
    (mp.set_mpattribute)("BM_ESRP:Lua:AsusVulDriverNoVerNumFound")
    return mp.INFECTED
  end
  if l_0_1 <= 2.8148356821811e+14 then
    (mp.set_mpattribute)("BM_ESRP:Lua:AsusVulDriverFound")
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

