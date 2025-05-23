-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4cb38924e2f9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = reportAVExcludedEntities()
if next(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN

