-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3a64d92a0\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[1]
if not l_0_0.matched or not l_0_0.ppid or not l_0_0.utf8p2 then
  return mp.CLEAN
end
;
(bm.add_related_string)("MaceNonV", tostring(l_0_0.utf8p2), bm.RelatedStringBMReport)
return mp.INFECTED

