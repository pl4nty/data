-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspDownloadZZ\0x00000323_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetCertificateInfo)()
if #l_0_0 > 0 and l_0_0 ~= nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_1, "/bin", 1, true) == 1 or (((string.find)(l_0_1, "/usr/", 1, true) == 1 and not (string.find)(l_0_1, "/usr/local/", 1, true) == 1) or (string.find)(l_0_1, "/applications/microsoft defender.app/", 1, true) == 1) then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (MpCommon.GetCurrentTimeT)()
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = (sysio.GetFileLastWriteTime)(l_0_3)
if l_0_5 == nil then
  return mp.CLEAN
end
if ((sysio.GetLastResult)()).Success and l_0_5 and l_0_5 ~= 0 then
  l_0_5 = l_0_5 / 10000000 - 11644473600
end
local l_0_6 = l_0_4 - (l_0_5)
if l_0_6 <= 0 then
  return mp.CLEAN
end
local l_0_7 = l_0_6 / 60
if l_0_7 > 5 then
  return mp.CLEAN
end
local l_0_8 = (macos.GetDownloadUrl)()
if l_0_8 == nil or l_0_8 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_8, "http://", 1, true) or (string.find)(l_0_8, "https://", 1, true) then
  local l_0_9 = "MAC_BROWSERDOWNLOAD_PATH"
  local l_0_10 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_10 then
    TrackPidAndTechnique(l_0_10, "T1566.002", "InitialAccess_Phishing_SpearphishingLink")
    ;
    (MpCommon.BmTriggerSig)(l_0_10, "BM_SUSPFILE_SPEARPHISHING_LINK2", l_0_3)
  end
  AppendToRollingQueue(l_0_9, "mac_browserdownload_path", l_0_3, 7200, 100, 0)
  return mp.INFECTED
end
do
  return mp.CLEAN
end

