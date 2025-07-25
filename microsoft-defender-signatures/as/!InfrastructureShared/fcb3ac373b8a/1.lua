-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fcb3ac373b8a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "LocalAccountCreate"
if not (this_sigattrlog[1]).matched or not (this_sigattrlog[2]).matched or not (this_sigattrlog[3]).matched then
  return mp.CLEAN
end
local l_0_1 = (string.match)((this_sigattrlog[1]).utf8p2 or "", " user (.-) ")
local l_0_2 = (string.match)((this_sigattrlog[2]).utf8p2 or "", "([^ ]+) /add")
local l_0_3 = (string.match)((this_sigattrlog[3]).utf8p2 or "", "([^ ]+) /add")
if isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_3) or l_0_1 ~= l_0_2 or l_0_1 ~= l_0_3 then
  return mp.CLEAN
end
;
(bm.add_related_string)(l_0_0, l_0_1, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM((this_sigattrlog[1]).ppid, "T1098.007", "persist_user_local")
TrackPidAndTechniqueBM((this_sigattrlog[1]).ppid, "T1136.001", "persist_user_local")
TrackPidAndTechniqueBM((this_sigattrlog[2]).ppid, "T1098.007", "persist_user_local")
TrackPidAndTechniqueBM((this_sigattrlog[2]).ppid, "T1136.001", "persist_user_local")
TrackPidAndTechniqueBM((this_sigattrlog[3]).ppid, "T1098.007", "persist_user_local")
TrackPidAndTechniqueBM((this_sigattrlog[3]).ppid, "T1136.001", "persist_user_local")
return mp.INFECTED

