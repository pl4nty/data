-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d7b3415f7759\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRollingQueue("NewServiceCreated")
if l_0_0 and next(l_0_0) then
  (bm.add_related_string)("BYOD", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN

