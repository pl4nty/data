-- Threat: !InfrastructureShared
-- Name: !#ExtractedFromInterestingArchive.A
-- Type: 13
-- Includes: Path
-- MpAttributes: RPF:TopLevelFile & MpOnCloseNewlyCreatedHintRtpScan & Lua:ExplorerArchiveTempPathZip

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
l_0_0 = normalize_path(l_0_0)
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_1 ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.get_mpattribute("BM_MZ_FILE") or mp.get_mpattribute("BM_CONTAINER_FILE")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = "ArchiveTracker"
local l_0_4 = "InterestingZip.A"
local l_0_5, l_0_6 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_4, l_0_3)
if l_0_5 and l_0_6 ~= nil then
  for l_0_7, l_0_8 in pairs(l_0_6) do
    local l_0_9, l_0_10 = l_0_7:match("(.+\\)([^\\]+)$")
    if l_0_0:find(l_0_10, 1, true) ~= nil then
      mp.set_mpattribute("MpDisableCaching")
    end
  end
end
return mp.CLEAN
