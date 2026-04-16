-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d3d76a1fa5cb\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0 ~= nil and l_0_0.DeviceRoles ~= nil then
    local l_0_1 = (mp.GetScannedPPID)()
    if not l_0_1 then
      return mp.CLEAN
    end
    local l_0_2 = (string.lower)((mp.GetProcessCommandLine)(l_0_1))
    if l_0_2 == nil then
      return mp.CLEAN
    end
    if not (string.find)(l_0_2, "-q", 1, true) or not (string.find)(l_0_2, ":\\\"", 1, true) then
      return mp.CLEAN
    end
    local l_0_3 = getSessionInfo(l_0_1, "SuspTaskCreateOnHVA")
    set_research_data("HVASessionInfo", safeJsonSerialize(l_0_3), false)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

