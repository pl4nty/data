-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\206b32d60c603\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "%\\TimeProviders%\\+(.-)%\\"
local l_0_1 = (bm.get_current_process_startup_info)()
if isnull(l_0_1) or isnull((this_sigattrlog[2]).utf8p1) or isnull((this_sigattrlog[2]).utf8p2) or isnull((this_sigattrlog[1]).utf8p1) or isnull((this_sigattrlog[3]).utf8p1) or isnull((this_sigattrlog[4]).utf8p1) then
  return mp.CLEAN
end
local l_0_2 = (this_sigattrlog[2]).utf8p2
local l_0_3 = (this_sigattrlog[1]).utf8p2
if isnull(l_0_3) and (string.lower)(l_0_2) == "c:\\windows\\system32\\w32time.dll" then
  return mp.CLEAN
end
local l_0_4 = (string.match)((this_sigattrlog[1]).utf8p1, l_0_0)
local l_0_5 = (string.match)((this_sigattrlog[2]).utf8p1, l_0_0)
local l_0_6 = (string.match)((this_sigattrlog[3]).utf8p1, l_0_0)
local l_0_7 = (string.match)((this_sigattrlog[4]).utf8p1, l_0_0)
if isnull(l_0_4) or isnull(l_0_5) or isnull(l_0_6) or isnull(l_0_7) or l_0_4 ~= l_0_5 or l_0_5 ~= l_0_6 or l_0_5 ~= l_0_7 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM(l_0_1.ppid, "T1547.003", "persist_timeprovider")
;
(bm.add_related_file)(l_0_2)
local l_0_8 = bm.add_related_string
local l_0_9 = "TimeProviderPersistence"
local l_0_10 = safeJsonSerialize
local l_0_11 = {}
l_0_11.ProviderName = l_0_5
l_0_11.ProviderDLL = l_0_2
do
  l_0_11.PreviousDLL = l_0_3 or "N/A"
  l_0_10 = l_0_10(l_0_11)
  l_0_11 = bm
  l_0_11 = l_0_11.RelatedStringBMReport
  l_0_8(l_0_9, l_0_10, l_0_11)
  l_0_8 = mp
  l_0_8 = l_0_8.INFECTED
  do return l_0_8 end
  -- DECOMPILER ERROR at PC151: freeLocal<0 in 'ReleaseLocals'

end

