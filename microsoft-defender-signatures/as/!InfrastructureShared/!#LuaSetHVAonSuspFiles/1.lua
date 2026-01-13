-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaSetHVAonSuspFiles\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() or IsActiveDirectoryRole() then
  (mp.set_mpattribute)("Lua:IsDeviceHVA")
end
return mp.CLEAN

