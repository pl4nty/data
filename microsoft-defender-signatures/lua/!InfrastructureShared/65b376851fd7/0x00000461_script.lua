-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\65b376851fd7\0x00000461_luac 

-- params : ...
-- function num : 0
if (versioning.GetEngineBuild)() < 16700 then
  return mp.CLEAN
end
local l_0_0 = (versioning.GetOrgID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
return mp.INFECTED

