-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\95b318161acb\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall(reportBmInfo)
if not l_0_0 and l_0_1 then
  (bm.add_related_string)("bmInfoFailReason", tostring(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED

