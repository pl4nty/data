-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b8b3fd18a1c4\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[3]).matched then
  l_0_0 = (this_sigattrlog[3]).utf8p1
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
;
(mp.ReportLowfi)(l_0_0, 2623644159)
;
(bm.add_related_file)(l_0_0)
;
(bm.trigger_sig)("AttackIQPayload", l_0_0)
return mp.CLEAN

