-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\133b3811db768\1.luac 

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
local l_0_5 = (this_sigattrlog[2]).ppid
local l_0_6 = (this_sigattrlog[3]).ppid
local l_0_7 = bm.add_related_string
local l_0_8 = l_0_0
local l_0_9 = safeJsonSerialize
local l_0_10 = {}
l_0_10.User = l_0_1
l_0_10.PowerUserProc = l_0_5
l_0_10.RemoteDesktopProc = l_0_6
l_0_9 = l_0_9(l_0_10)
l_0_10 = bm
l_0_10 = l_0_10.RelatedStringBMReport
l_0_7(l_0_8, l_0_9, l_0_10)
if l_0_5 then
  l_0_7 = TrackPidAndTechniqueBM
  l_0_8 = l_0_5
  l_0_9 = "T1098.007"
  l_0_10 = "persist_user_local"
  l_0_7(l_0_8, l_0_9, l_0_10)
  l_0_7 = TrackPidAndTechniqueBM
  l_0_8 = l_0_5
  l_0_9 = "T1136.001"
  l_0_10 = "persist_user_local"
  l_0_7(l_0_8, l_0_9, l_0_10)
end
if l_0_6 then
  l_0_7 = TrackPidAndTechniqueBM
  l_0_8 = l_0_6
  l_0_9 = "T1098.007"
  l_0_10 = "persist_user_local"
  l_0_7(l_0_8, l_0_9, l_0_10)
  l_0_7 = TrackPidAndTechniqueBM
  l_0_8 = l_0_6
  l_0_9 = "T1136.001"
  l_0_10 = "persist_user_local"
  l_0_7(l_0_8, l_0_9, l_0_10)
end
l_0_7 = mp
l_0_7 = l_0_7.INFECTED
return l_0_7

