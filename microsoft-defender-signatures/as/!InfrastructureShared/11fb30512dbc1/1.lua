-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11fb30512dbc1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "LocalAccountCreate"
local l_0_1 = (string.match)((this_sigattrlog[1]).utf8p2 or "", " user (.-) ")
local l_0_2 = (string.match)((this_sigattrlog[2]).utf8p2 or "", "([^ ]+) /add")
local l_0_3 = (string.match)((this_sigattrlog[3]).utf8p2 or "", "([^ ]+) /add")
local l_0_4 = (string.match)((this_sigattrlog[4]).utf8p2 or "", "([^ ]+) /delete")
if isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_3) or isnull(l_0_4) or l_0_1 ~= l_0_2 or l_0_1 ~= l_0_3 or l_0_1 ~= l_0_4 then
  return mp.CLEAN
end
local l_0_5 = bm.add_related_string
local l_0_6 = l_0_0
local l_0_7 = safeJsonSerialize
local l_0_8 = {}
l_0_8.User = l_0_1
l_0_7 = l_0_7(l_0_8)
l_0_8 = bm
l_0_8 = l_0_8.RelatedStringBMReport
l_0_5(l_0_6, l_0_7, l_0_8)
l_0_5 = bm
l_0_5 = l_0_5.get_current_process_startup_info
l_0_5 = l_0_5()
if l_0_5 then
  l_0_6 = l_0_5.ppid
  if l_0_6 then
    l_0_6 = TrackPidAndTechniqueBM
    l_0_7 = l_0_5.ppid
    l_0_8 = "T1098.007"
    l_0_6(l_0_7, l_0_8, "persist_user_local")
    l_0_6 = TrackPidAndTechniqueBM
    l_0_7 = l_0_5.ppid
    l_0_8 = "T1136.001"
    l_0_6(l_0_7, l_0_8, "persist_user_local")
  end
end
l_0_6 = mp
l_0_6 = l_0_6.INFECTED
return l_0_6

