-- Threat: !InfrastructureShared
-- Name: !#ExtractedFromInterestingArchive.B
-- Type: 13
-- Includes: Path
-- MpAttributes: RPF:TopLevelFile & Lua:FileHasMOTW & MpOnOpenOrCloseRtpScan & Lua:ExplorerArchiveTempPathZip

local l_0_0 = mp.get_mpattribute("BM_MZ_FILE") or mp.get_mpattribute("BM_CONTAINER_FILE")
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetMOTWZone()
if l_0_1 == nil or l_0_1 < 3 then
  return mp.CLEAN
end
local l_0_2 = mp.GetMOTWReferrerUrl()
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = normalize_path(l_0_2)
local l_0_3 = "ArchiveTracker"
local l_0_4 = "InterestingZip.A"
local l_0_5, l_0_6 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_0_4, l_0_3, l_0_2)
if l_0_5 and l_0_6 ~= nil then
  mp.set_mpattribute("Lua:MotWFromIntZip")
  mp.set_mpattribute("Lua:MotWFromIntZip" .. "_" .. l_0_6.value)
end
return mp.CLEAN
