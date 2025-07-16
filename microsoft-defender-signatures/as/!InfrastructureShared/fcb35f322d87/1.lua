-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fcb35f322d87\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "LocalAccountCreate"
local l_0_1 = (string.match)((string.lower)((this_sigattrlog[1]).utf8p2 or ""), " user (.-) ")
local l_0_2 = (this_sigattrlog[1]).ppid
local l_0_3 = (string.match)((string.lower)((this_sigattrlog[2]).utf8p2 or ""), "([^ ]+) /add")
local l_0_4 = (this_sigattrlog[2]).ppid
local l_0_5 = (string.match)((string.lower)((this_sigattrlog[3]).utf8p2 or ""), "([^ ]+) /add")
local l_0_6 = (this_sigattrlog[3]).ppid
local l_0_7 = bm.add_related_string
local l_0_8 = l_0_0
local l_0_9 = safeJsonSerialize
local l_0_10 = {}
do
  l_0_10.UN = l_0_1 or ""
  l_0_10.UP = l_0_3 or ""
  l_0_10.UR = l_0_5 or ""
  l_0_10.PN = l_0_2 or ""
  l_0_10.PP = l_0_4 or ""
  l_0_10.PR = l_0_6 or ""
  l_0_10.UN2 = (this_sigattrlog[1]).utf8p2 or ""
  l_0_10.UP2 = (this_sigattrlog[2]).utf8p2 or ""
  l_0_10.UR2 = (this_sigattrlog[3]).utf8p2 or ""
  l_0_9 = l_0_9(l_0_10)
  l_0_10 = bm
  l_0_10 = l_0_10.RelatedStringBMReport
  l_0_7(l_0_8, l_0_9, l_0_10)
  if l_0_4 then
    l_0_7 = TrackPidAndTechniqueBM
    l_0_8 = l_0_4
    l_0_9 = "T1098.007"
    l_0_10 = "persist_user_local"
    l_0_7(l_0_8, l_0_9, l_0_10)
    l_0_7 = TrackPidAndTechniqueBM
    l_0_8 = l_0_4
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
  do return l_0_7 end
  -- DECOMPILER ERROR at PC130: freeLocal<0 in 'ReleaseLocals'

end

