-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\131d720a4a630\1.luac 

-- params : ...
-- function num : 0
do
  if IsDeviceHVA() then
    local l_0_0 = ExtractDeviceProperties()
    if l_0_0.DeviceRoles and ((l_0_0.DeviceRoles).DomainController ~= nil or (l_0_0.DeviceRoles).Dns ~= nil) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

