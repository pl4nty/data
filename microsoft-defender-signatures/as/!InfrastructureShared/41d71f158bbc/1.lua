-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41d71f158bbc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
do
  if IsDeviceHVA() then
    local l_0_1 = ExtractDeviceProperties()
    if l_0_1.DeviceRoles and ((l_0_1.DeviceRoles).DomainController ~= nil or (l_0_1.DeviceRoles).Dns ~= nil) then
      l_0_0 = true
    end
  end
  if not l_0_0 and IsActiveDirectoryRole() then
    l_0_0 = true
  end
  if l_0_0 then
    return mp.INFECTED
  end
  return mp.CLEAN
end

