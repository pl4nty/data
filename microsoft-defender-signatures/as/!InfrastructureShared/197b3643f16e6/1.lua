-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\197b3643f16e6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "%\\TimeProviders%\\+(.-)%\\"
local l_0_1 = (bm.get_current_process_startup_info)()
if isnull(l_0_1) or isnull((this_sigattrlog[1]).utf8p1) or isnull((this_sigattrlog[1]).utf8p2) or isnull((this_sigattrlog[2]).utf8p1) or isnull((this_sigattrlog[3]).utf8p1) then
  return mp.CLEAN
end
local l_0_2 = (this_sigattrlog[1]).utf8p2
local l_0_3 = (string.match)((this_sigattrlog[1]).utf8p1, l_0_0)
local l_0_4 = (string.match)((this_sigattrlog[2]).utf8p1, l_0_0)
local l_0_5 = (string.match)((this_sigattrlog[3]).utf8p1, l_0_0)
if isnull(l_0_3) or isnull(l_0_4) or isnull(l_0_5) or l_0_3 ~= l_0_4 or l_0_3 ~= l_0_5 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM(l_0_1.ppid, "T1547.003", "persist_timeprovider")
;
(bm.add_related_file)(l_0_2)
local l_0_6 = bm.add_related_string
local l_0_7 = "TimeProviderPersistence"
local l_0_8 = safeJsonSerialize
local l_0_9 = {}
l_0_9.ProviderName = l_0_3
l_0_9.ProviderDLL = l_0_2
l_0_8 = l_0_8(l_0_9)
l_0_9 = bm
l_0_9 = l_0_9.RelatedStringBMReport
l_0_6(l_0_7, l_0_8, l_0_9)
l_0_6 = mp
l_0_6 = l_0_6.INFECTED
return l_0_6

