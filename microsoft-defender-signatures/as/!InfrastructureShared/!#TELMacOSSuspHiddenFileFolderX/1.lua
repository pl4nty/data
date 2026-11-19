-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspHiddenFileFolder.X
-- Type: 13
-- Includes: TechniqueTracker, BMLuaLib
-- MpAttributes: RPF:TopLevelFile & (BM_MACHO32_FILE | BM_MACHO64_FILE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen) | BM_SH_FILE | BM_PY_FILE | Lua:PYExt | Possible_PythonCode)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 == "" or l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, "/bin", 1, true) == 1 or string.find(l_0_1, "/system", 1, true) == 1 or string.find(l_0_1, "/library/apple/", 1, true) == 1 or string.find(l_0_1, "/library/installersandboxes/", 1, true) == 1 or string.find(l_0_1, "/library/systemextensions/", 1, true) == 1 or string.find(l_0_1, "/.git/modules/", 1, true) or string.find(l_0_1, "/.git/hooks/", 1, true) or string.find(l_0_1, "/sbin", 1, true) == 1 or string.find(l_0_1, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_1, "/private/var/folders/", 1, true) == 1 or string.find(l_0_1, "/usr/", 1, true) == 1 and not string.find(l_0_1, "/usr/local/", 1, true) == 1 or string.find(l_0_1, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if (string.find(l_0_1, "/contents/resources", 1, true) or string.find(l_0_1, "/users/shared", 1, true) or string.find(l_0_1, "/library", 1, true)) and (string.find(l_0_2, ".", 1, true) == 1 or string.find(l_0_1, "/.", 1, true)) then
  if l_0_3 then
    TrackPidAndTechnique(l_0_3, "T1564.001", "DefenseEvasion_HiddenFilesandDirectories")
    MpCommon.BmTriggerSig(l_0_3, "BM_SuspMacHiddenFileFolder", l_0_1)
  end
  return mp.INFECTED
end
return mp.CLEAN
