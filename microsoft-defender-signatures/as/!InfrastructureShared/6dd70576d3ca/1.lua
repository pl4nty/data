-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6dd70576d3ca\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  local l_0_0 = ""
  local l_0_1 = ExtractDeviceProperties()
  if l_0_1.DeviceRoles ~= nil then
    for l_0_5,l_0_6 in pairs(l_0_1.DeviceRoles) do
      l_0_0 = l_0_0 .. ";" .. l_0_5
    end
    local l_0_7 = (mp.GetParentProcInfo)()
    if not isnull(l_0_7) and not isnull(l_0_7.ppid) then
      (MpCommon.BmTriggerSig)(l_0_7.ppid, "HvaRoles!", l_0_0)
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

