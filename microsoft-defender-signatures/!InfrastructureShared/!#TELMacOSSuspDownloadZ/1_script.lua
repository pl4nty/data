-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspDownloadZ\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_0, "/bin", 1, true) == 1 or (((string.find)(l_0_0, "/usr/", 1, true) == 1 and not (string.find)(l_0_0, "/usr/local/", 1, true) == 1) or (string.find)(l_0_0, "/applications/microsoft defender.app/", 1, true) == 1) then
  return mp.CLEAN
end
if (string.find)(l_0_0, "/contents/resources", 1, true) or (string.find)(l_0_0, "/users/shared", 1, true) or (string.find)(l_0_0, "/library", 1, true) or (string.find)(l_0_0, "/private/tmp/", 1, true) == 1 or (string.find)(l_0_0, "/var/tmp/", 1, true) == 1 then
  local l_0_3 = (macos.GetDownloadUrl)()
  if l_0_3 == "" or l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  do
    do
      if (string.find)(l_0_3, "drive.google.com", 1, true) or (string.find)(l_0_3, "linkedin.com", 1, true) or (string.find)(l_0_3, ".googleusercontent.com", 1, true) or (string.find)(l_0_3, "https://lnkd.", 1, true) or (string.find)(l_0_3, "github.", 1, true) or (string.find)(l_0_3, "raw.githubusercontent", 1, true) or (string.find)(l_0_3, ".licdn.com", 1, true) then
        local l_0_5 = "MAC_BROWSERDOWNLOAD_PATH"
        if l_0_4 then
          TrackPidAndTechnique(l_0_4, "T1566.002", "InitialAccess_Phishing_SpearphishingLink")
          ;
          (MpCommon.BmTriggerSig)(l_0_4, "BM_SUSPFILE_SPEARPHISHING_LINK", l_0_2)
        end
        AppendToRollingQueue(l_0_5, "mac_browserdownload_path", l_0_2, 7200, 100, 0)
        return mp.INFECTED
      end
      do return mp.CLEAN end
      return mp.CLEAN
    end
  end
end

