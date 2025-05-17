-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspSignedDownloadA\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetCertificateInfo)()
if #l_0_0 > 0 and l_0_0 ~= nil then
  local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  if not SuspMacPathsToMonitor(l_0_1, true) then
    return mp.CLEAN
  end
  local l_0_2, l_0_3 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_3 == nil or l_0_3 == "" or l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_2 = l_0_2 .. "/"
  if (string.find)(l_0_2, "/library/application support/microsoft edge/default/sessions/", 1, true) or (string.find)(l_0_2, "/library/application support/firefox/profiles/", 1, true) or (string.find)(l_0_2, "/library/caches/firefox/profiles/", 1, true) or (string.find)(l_0_2, "/library/preferences/com.apple", 1, true) or (string.find)(l_0_3, ".crdownload", 1, true) or (string.find)(l_0_3, ".part", -5, true) or (string.find)(l_0_3, ".com.google.", 1, true) or (string.find)(l_0_3, ".com.microsoft.edgemac", 1, true) then
    return mp.CLEAN
  end
  if (string.find)(l_0_1, "->(MachO-UniBin-", 1, true) then
    l_0_1 = l_0_1:gsub("%->%(MachO%-UniBin%-.*", "")
  end
  local l_0_4 = (MpCommon.GetCurrentTimeT)()
  if l_0_4 == nil then
    return mp.CLEAN
  end
  local l_0_5 = (sysio.GetFileLastWriteTime)(l_0_1)
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
  if l_0_7 > 4 then
    return mp.CLEAN
  end
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC198: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC199: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC201: Overwrote pending register: R10 in 'AssignReg'

  local l_0_9 = (("safari").get_contextdata)(("microsoft edge").CONTEXT_DATA_PROCESSNAME)
  if l_0_9 == nil or l_0_9 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC213: Overwrote pending register: R11 in 'AssignReg'

  for l_0_13,l_0_14 in pairs(l_0_8) do
    -- DECOMPILER ERROR at PC222: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC224: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC225: Overwrote pending register: R17 in 'AssignReg'

    if l_0_14 ~= nil and (("thunderbird").find)("gmail", "com.apple.safari.sandboxbroker", 1, true) == 1 then
      local l_0_15 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
      local l_0_16 = "MAC_SIGNED_BROWSERDOWNLOAD_PATH"
      local l_0_17 = l_0_1:match("(/.*)/")
      if not (string.find)(l_0_17, ".download", -9, true) or l_0_15 then
        (MpCommon.BmTriggerSig)(l_0_15, "BM_SIGNED_MACFILE_DOWNLOADFROM_BROWSERMAIL", l_0_1)
        TrackPidAndTechnique(l_0_15, "T1566.002", "InitialAccess_Phishing_SpearphishingLinkSigned")
      end
      if not IsKeyValuePairInRollingQueue(l_0_16, "mac_signed_browserdownload_path", (string.lower)(l_0_1)) then
        AppendToRollingQueue(l_0_16, "mac_signed_browserdownload_path", (string.lower)(l_0_1), 7200, 100, 0)
      end
      return mp.INFECTED
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC293: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC294: Overwrote pending register: R1 in 'AssignReg'

    do return l_0_1 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

