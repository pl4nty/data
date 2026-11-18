-- Threat: !InfrastructureShared
-- Name: !#SLF:LUA:ZeroToleranceLockdown.A
-- Type: 10
-- Includes: Path, TechniqueTracker
-- MpAttributes: BM_MZ_FILE & RPF:TopLevelFile & MpOnOpenRtpScan

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if not peattributes.isexe or peattributes.isdamaged or true ~= mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
l_0_0 = normalize_path(l_0_0)
if l_0_0 == nil then
  return mp.CLEAN
end
if isKnownCleanPathContext(l_0_0) == true then
  return mp.CLEAN
end
local l_0_2 = l_0_0 .. "\\" .. l_0_1
if mp.IsKnownFriendlyFile(l_0_2, false, false) == true then
  return mp.CLEAN
end
if mp.IsTrustedFile(true) then
  return mp.CLEAN
end
return mp.INFECTED
