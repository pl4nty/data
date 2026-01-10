-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFBackdoorASPllehsbewWA!hva\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.match)(l_0_0, "\\microsoft shared\\web server extensions\\%d%d\\template\\layouts\\") == nil then
  return mp.CLEAN
end
if IsSharepointServer() then
  return mp.INFECTED
end
do
  if IsDeviceHVA() then
    local l_0_1 = ExtractDeviceProperties()
    if l_0_1.DeviceRoles and (l_0_1.DeviceRoles).SharePointServer ~= nil then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

