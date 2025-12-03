-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab3196a84b1\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() and ((ExtractDeviceProperties()).DeviceRoles).DomainController ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

