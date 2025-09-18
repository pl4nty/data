-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7bb3bf1eacc1\1.luac 

-- params : ...
-- function num : 0
do
  if IsDeviceHVA() then
    local l_0_0 = ExtractDeviceProperties()
    if l_0_0.IsInternetFacing == true and (l_0_0.DeviceRoles).DomainAdminDevice ~= nil then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

