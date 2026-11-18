-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspDPRKShMasquerading.V
-- Type: 13
-- Includes: TechniqueTracker, BMLuaLib
-- MpAttributes: (RPF:TopLevelFile & BM_SH_FILE)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = l_0_2:gsub("%s", "")
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_6 = l_0_1 .. "/" .. l_0_2
if SuspMacPathsToMonitor(l_0_6, true) then
  local l_0_7 = {
    "celastradepro",
    "testspeed",
    "jmttrading",
    "macshare",
    "unioncrypto",
    "coingotrade",
    "3cxdesktop",
    "arialunicode",
    "beavertail",
    "coinbase",
    "pdfviewer",
    "docker",
    "teams",
    "wifianalytics",
    "crossplatformbridges",
    "financialstability",
    "discord",
    "edoneviewer",
    "esilet",
    "hloader",
    "findertools",
    "finderfonts",
    "pdfviewer",
    "cryptocurrency",
    "sugarloader",
    "zoom",
    "jobopportunities",
    "voiceinstallerd",
    "jmttrader",
    "daiwaventures",
    "bizlato",
    "dafom",
    "mirotalk",
    "tokenais",
    "xpcprotect",
    "howardcalendar"
  }
  for l_0_8, l_0_9 in pairs(l_0_7) do
    if string.match(l_0_4, l_0_9) then
      mp.set_mpattribute("BM_MacDPRKMasquerading")
      if l_0_5 then
        MpCommon.BmTriggerSig(l_0_5, "BM_MacDPRKMasquerading", l_0_3)
        TrackPidAndTechnique(l_0_5, "T1036.005", "DefenseEvasion_Masquerading_BundleWitPopularName")
      end
      return mp.INFECTED
    end
    local l_0_10 = l_0_4:gsub("%W", "")
    if string.match(l_0_10, l_0_9) then
      mp.set_mpattribute("BM_MacDPRKMasquerading")
      if l_0_5 then
        MpCommon.BmTriggerSig(l_0_5, "BM_MacDPRKMasquerading", l_0_3)
        TrackPidAndTechnique(l_0_5, "T1036.005", "DefenseEvasion_Masquerading_BundleWitPopularName")
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
