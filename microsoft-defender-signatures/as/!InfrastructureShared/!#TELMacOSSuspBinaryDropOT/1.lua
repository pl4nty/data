-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspBinaryDrop.OT
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: RPF:TopLevelFile & ((BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen) | BM_MACHO32_FILE | BM_MACHO64_FILE | BM_DMG_FILE)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.GetCertificateInfo()
if 0 < #l_0_1 and l_0_1 ~= nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil or l_0_3 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_5 = l_0_2 .. "/" .. l_0_3
if string.find(l_0_2, "/private/tmp", 1, true) == 1 or string.find(l_0_2, "/private/var", 1, true) == 1 or string.find(l_0_2, "/private/etc", 1, true) == 1 or string.find(l_0_2, "/library", 1, true) == 1 or string.find(l_0_2, "/users/", 1, true) == 1 or string.find(l_0_2, "/volumes/", 1, true) == 1 or string.find(l_0_2, "/usr/local", 1, true) == 1 then
  local l_0_6 = {
    "visualstudio",
    "adobe",
    "flash",
    "update",
    "celastradepro",
    "jobinfo",
    "chrome",
    "pdf",
    "discord",
    "word",
    "excel",
    "onenote",
    "edge",
    "outlook",
    "powerpoint",
    "teams",
    "remote",
    "calendar",
    "calculator",
    "itunes",
    "imovie",
    "facetime",
    "launchpad",
    "maps",
    "numbers",
    "ondrive",
    "reminder",
    "safari",
    "mail",
    "photos",
    "time machine",
    "desktop",
    "magnet",
    "alfred",
    "pdf expert",
    "disk drill",
    "cleverfile",
    "miner",
    "telegram",
    "teamspeak",
    "element",
    "mumble",
    "guilded",
    "apple",
    "mozilla",
    "firefox",
    "oracle",
    "xpcservice",
    "microsoft",
    "launch",
    "zoom",
    "copilot",
    "google meet",
    "coscreen",
    "gitsi",
    "goto",
    "webex"
  }
  for l_0_7, l_0_8 in pairs(l_0_6) do
    if string.match(l_0_3, l_0_8) then
      mp.set_mpattribute("BM_MacBinaryMasquerading")
      if l_0_4 then
        MpCommon.BmTriggerSig(l_0_4, "BM_MacBinaryMasquerading", l_0_5)
        TrackPidAndTechnique(l_0_4, "T1036.005", "DefenseEvasion_Masquerading_ExecWitPopularName")
      end
      return mp.INFECTED
    end
    local l_0_9 = l_0_3:gsub("%W", "")
    if string.match(l_0_9, l_0_8) then
      mp.set_mpattribute("BM_MacBinaryMasquerading")
      if l_0_4 then
        MpCommon.BmTriggerSig(l_0_4, "BM_MacBinaryMasquerading", l_0_5)
        TrackPidAndTechnique(l_0_4, "T1036.005", "DefenseEvasion_Masquerading_ExecWitPopularName")
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
