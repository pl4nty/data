-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspExecutable.Y
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: RPF:TopLevelFile & (BM_MACHO32_FILE | BM_MACHO64_FILE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen))

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "/bin/", 1, true) == 1 or string.find(l_0_0, "/system/", 1, true) == 1 or string.find(l_0_0, "/sbin/", 1, true) == 1 or string.find(l_0_0, "/library/apple/", 1, true) == 1 or string.find(l_0_0, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_0, "/usr/", 1, true) == 1 and not string.find(l_0_0, "/usr/local/", 1, true) == 1 or string.find(l_0_0, "/applications/microsoft defender.app/", 1, true) == 1 or string.find(l_0_0, "/applications/qgis-ltr.app/contents/resources/", 1, true) or string.find(l_0_0, "/applications/grass-", 1, true) and string.find(l_0_0, ".app/contents/resources/", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_3 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = {
  ".nib",
  ".png",
  ".jpeg",
  ".jpg",
  ".pdf",
  ".docx",
  ".dmg",
  ".pkg",
  ".doc",
  ".ppt",
  ".pptx",
  ".xls",
  ".xlsx",
  ".mp4",
  ".mp3",
  ".heif",
  ".mkv"
}
for l_0_5, l_0_6 in pairs(l_0_4) do
  local l_0_7 = string.len(l_0_6)
  if l_0_6 ~= nil and string.find(l_0_1, l_0_6, -l_0_7, true) then
    if l_0_2 then
      TrackPidAndTechnique(l_0_2, "T1036.008", "DefenseEvasion_Masquerading")
      MpCommon.BmTriggerSig(l_0_2, "BM_SuspMacFileWithOtherExt", l_0_3)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
