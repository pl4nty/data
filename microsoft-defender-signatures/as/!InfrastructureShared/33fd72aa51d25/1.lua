-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\33fd72aa51d25\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) and not isnull(l_0_0.ppid) and (string.find)((string.lower)(l_0_0.image_path), "w3wp.exe", -8, true) and IsDeviceHVA() then
  local l_0_1 = ""
  local l_0_2 = ExtractDeviceProperties()
  if l_0_2.DeviceRoles ~= nil then
    for l_0_6,l_0_7 in pairs(l_0_2.DeviceRoles) do
      l_0_1 = l_0_1 .. ";" .. l_0_6
    end
    ;
    (MpCommon.BmTriggerSig)(l_0_0.ppid, "HvaRoles!", l_0_1)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

