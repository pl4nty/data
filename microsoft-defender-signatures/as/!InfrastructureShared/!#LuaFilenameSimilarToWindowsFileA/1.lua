-- Threat: !InfrastructureShared
-- Name: !#Lua:FilenameSimilarToWindowsFile.A
-- Type: 10
-- Includes: Path
-- MpAttributes: RPF:TopLevelFile & MpNewlyCreatedHint

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 <= 5 or 48 < #l_0_1 or string.sub(l_0_1, -4, -4) ~= "." or l_0_0 == nil or #l_0_0 < 3 or string.sub(l_0_0, -17) == "\\windows\\system32" or string.sub(l_0_0, -17) == "\\windows\\syswow64" then
  return mp.CLEAN
end
local l_0_2 = normalize_path(l_0_0)
if 65 < #l_0_2 and (string.sub(l_0_2, 2, 17) == ":\\windows\\winsxs" or string.sub(l_0_2, 2, 20) == ":\\windows\\servicing" or string.sub(l_0_2, 2, 31) == ":\\windows\\softwaredistribution" or string.sub(l_0_2, 2, 15) == ":\\windows\\csc\\" or string.sub(l_0_2, 2, 20) == ":\\windows\\assembly\\") or string.sub(l_0_2, 0, 2) == "\\\\" or string.sub(l_0_2, 2, 16) == ":\\program files" then
  return mp.CLEAN
end
local l_0_3 = string.sub(l_0_1, -3)
if l_0_3 ~= "exe" and l_0_3 ~= "dll" and l_0_3 ~= "ocx" and l_0_3 ~= "cpl" and l_0_3 ~= "com" then
  return mp.CLEAN
end
local l_0_4 = l_0_2 .. "\\" .. l_0_1
if mp.IsKnownFriendlyFile(l_0_4, false, false) == true then
  return mp.CLEAN
end
if mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") and mp.IsTrustedFile(false) == true then
  return mp.CLEAN
end
local l_0_5 = MpCommon.ExpandEnvironmentVariables("%windir%")
if l_0_5 == nil or #l_0_5 < 4 then
  return mp.CLEAN
end
local l_0_6 = l_0_5 .. "\\system32\\" .. l_0_1
if sysio.IsFileExists(l_0_6) then
  local l_0_7 = "Lua:FilenameExistInSystemFolder.A"
  mp.set_mpattribute(l_0_7)
  mp.set_mpattribute(l_0_7 .. "!" .. l_0_3)
  mp.set_mpattribute(l_0_7 .. "!" .. l_0_1)
  return mp.INFECTED
end
local l_0_8 = l_0_5 .. "\\syswow64\\" .. l_0_1
if sysio.IsFileExists(l_0_8) then
  local l_0_9 = "Lua:FilenameExistInSyswowFolder.A"
  mp.set_mpattribute(l_0_9)
  mp.set_mpattribute(l_0_9 .. "!" .. l_0_3)
  mp.set_mpattribute(l_0_9 .. "!" .. l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
