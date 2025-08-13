-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35b38f73bdfc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true
l_0_0["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
if not l_0_0[(string.lower)((versioning.GetOrgID)() or "")] then
  return mp.CLEAN
end
local l_0_1 = "ExecutableNonTextSection"
if isnull((this_sigattrlog[1]).utf8p1) or isnull((this_sigattrlog[2]).utf8p1) then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (string.match)((this_sigattrlog[1]).utf8p1, "OriginalPath:(.-)_OriginalSection:(.+)")
if isnull(l_0_2) or isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = bm.add_related_string
local l_0_5 = l_0_1
local l_0_6 = safeJsonSerialize
local l_0_7 = {}
l_0_7.Original = l_0_2
l_0_7.Embedded = (this_sigattrlog[2]).utf8p1
l_0_7.Section = l_0_3
l_0_6 = l_0_6(l_0_7)
l_0_7 = bm
l_0_7 = l_0_7.RelatedStringBMReport
l_0_4(l_0_5, l_0_6, l_0_7)
l_0_4 = bm
l_0_4 = l_0_4.add_threat_file
l_0_5 = l_0_2
l_0_4(l_0_5)
l_0_4 = bm
l_0_4 = l_0_4.add_threat_file
l_0_5 = this_sigattrlog
l_0_5 = l_0_5[2]
l_0_5 = l_0_5.utf8p1
l_0_4(l_0_5)
l_0_4 = bm
l_0_4 = l_0_4.get_current_process_startup_info
l_0_4 = l_0_4()
if l_0_4 then
  l_0_5 = l_0_4.ppid
  if l_0_5 then
    l_0_5 = TrackPidAndTechniqueBM
    l_0_6 = l_0_4.ppid
    l_0_7 = "T1027.009"
    l_0_5(l_0_6, l_0_7, "evasion_embeddedpe")
  end
end
l_0_5 = mp
l_0_5 = l_0_5.INFECTED
return l_0_5

