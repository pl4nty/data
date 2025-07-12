-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e8b3e553e362\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "LocalAccountCreate"
local l_0_1 = (string.match)((this_sigattrlog[1]).utf8p2 or "", " user (.-) ")
local l_0_2 = (string.match)((this_sigattrlog[2]).utf8p2 or "", "([^ ]+) /add")
local l_0_3 = (string.match)((this_sigattrlog[3]).utf8p2 or "", "([^ ]+) /add")
if isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_3) or l_0_1 ~= l_0_2 or l_0_1 ~= l_0_3 then
  return mp.CLEAN
end
local l_0_4 = bm.add_related_string
local l_0_5 = l_0_0
local l_0_6 = safeJsonSerialize
local l_0_7 = {}
l_0_7.User = l_0_1
l_0_6 = l_0_6(l_0_7)
l_0_7 = bm
l_0_7 = l_0_7.RelatedStringBMReport
l_0_4(l_0_5, l_0_6, l_0_7)
l_0_4 = bm
l_0_4 = l_0_4.get_current_process_startup_info
l_0_4 = l_0_4()
if l_0_4 then
  l_0_5 = l_0_4.ppid
  if l_0_5 then
    l_0_5 = TrackPidAndTechniqueBM
    l_0_6 = l_0_4.ppid
    l_0_7 = "T1098.007"
    l_0_5(l_0_6, l_0_7, "persist_user_local")
    l_0_5 = TrackPidAndTechniqueBM
    l_0_6 = l_0_4.ppid
    l_0_7 = "T1136.001"
    l_0_5(l_0_6, l_0_7, "persist_user_local")
  end
end
l_0_5 = mp
l_0_5 = l_0_5.INFECTED
return l_0_5

