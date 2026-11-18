-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspBundleDrop.V
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: (RPF:TopLevelFile & (BM_DMG_FILE | BM_XAR_ARCHIVE_FILE))

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_4 = l_0_1 .. "/" .. l_0_2
if string.find(l_0_1, "/private/tmp", 1, true) == 1 or string.find(l_0_1, "/private/var", 1, true) == 1 or string.find(l_0_1, "/private/etc", 1, true) == 1 or string.find(l_0_1, "/library", 1, true) == 1 or string.find(l_0_1, "/usr/local", 1, true) == 1 then
  local l_0_5 = {
    "visualstudio",
    "adobe",
    "flash",
    "update",
    "patch",
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
  for l_0_6, l_0_7 in pairs(l_0_5) do
    if string.match(l_0_2, l_0_7) then
      mp.set_mpattribute("BM_MacAppMasquerading")
      if l_0_3 then
        MpCommon.BmTriggerSig(l_0_3, "BM_MacMasquerading", l_0_4)
        TrackPidAndTechnique(l_0_3, "T1036.005", "DefenseEvasion_Masquerading_BundleWitPopularName")
      end
      return mp.INFECTED
    end
    local l_0_8 = l_0_2:gsub("%W", "")
    if string.match(l_0_8, l_0_7) then
      mp.set_mpattribute("BM_MacAppMasquerading")
      if l_0_3 then
        MpCommon.BmTriggerSig(l_0_3, "BM_MacMasquerading", l_0_4)
        TrackPidAndTechnique(l_0_3, "T1036.005", "DefenseEvasion_Masquerading_BundleWitPopularName")
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
