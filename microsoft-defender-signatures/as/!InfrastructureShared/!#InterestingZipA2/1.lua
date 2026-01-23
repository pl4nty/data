-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#InterestingZipA2\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
l_0_0 = normalize_path(l_0_0)
local l_0_2 = nil
if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) and (mp.GetMOTWZone)() >= 3 then
  l_0_2 = "HasMotW"
end
if l_0_2 == nil and l_0_0:find("\\downloads", 1, true) ~= nil then
  l_0_2 = "DownloadsFolder"
end
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_3 == "telegram.exe" then
  l_0_2 = l_0_2 .. "Telegram"
else
  return mp.CLEAN
end
;
(mp.set_mpattribute)("Lua:InterestingZip_" .. l_0_2)
local l_0_4 = "ArchiveTracker"
local l_0_5 = l_0_0 .. "\\" .. l_0_1
AppendToRollingQueueNamespaced("InterestingZip.A", l_0_4, l_0_5, l_0_2, 600)
return mp.CLEAN

