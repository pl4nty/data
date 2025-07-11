-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ccb3edce7fe2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "PrintProcessor"
local l_0_1 = (string.match)((this_sigattrlog[2]).utf8p1 or "", "%\\([^%\\]+)%\\%\\")
local l_0_2 = (this_sigattrlog[2]).utf8p2
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = bm.add_related_string
local l_0_4 = l_0_0
local l_0_5 = safeJsonSerialize
local l_0_6 = {}
l_0_6.DriverName = l_0_1
l_0_6.DriverFile = l_0_2
l_0_5 = l_0_5(l_0_6)
l_0_6 = bm
l_0_6 = l_0_6.RelatedStringBMReport
l_0_3(l_0_4, l_0_5, l_0_6)
l_0_3 = bm
l_0_3 = l_0_3.get_current_process_startup_info
l_0_3 = l_0_3()
if l_0_3 then
  l_0_4 = l_0_3.ppid
  if l_0_4 then
    l_0_4 = TrackPidAndTechniqueBM
    l_0_5 = l_0_3.ppid
    l_0_6 = "T1547.012"
    l_0_4(l_0_5, l_0_6, "persist_printprocessor_driver")
  end
end
l_0_4 = mp
l_0_4 = l_0_4.INFECTED
return l_0_4

