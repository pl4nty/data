-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6bb3ca455572\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[1]).matched then
  l_0_0 = (this_sigattrlog[1]).utf8p1
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
;
(mp.ReportLowfi)(l_0_0, 2623644159)
;
(bm.add_related_file)(l_0_0)
;
(bm.trigger_sig)("CymulatePayloadFile", l_0_0)
return mp.CLEAN

