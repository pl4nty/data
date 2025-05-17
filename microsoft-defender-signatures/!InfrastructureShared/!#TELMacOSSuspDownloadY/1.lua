-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspDownloadY\1.luac 

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
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC122: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC123: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC124: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in ("job")("offer") do
    -- DECOMPILER ERROR at PC129: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC131: Overwrote pending register: R10 in 'AssignReg'

    if l_0_8 ~= nil and (("careers").find)("finderfontsupdater", l_0_8, 1, true) then
      local l_0_9 = (macos.GetDownloadUrl)()
      if l_0_9 == "" or l_0_9 == nil then
        return mp.CLEAN
      end
      local l_0_10 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
      do
        do
          if (string.find)(l_0_9, "drive.google.com", 1, true) or (string.find)(l_0_9, "linkedin.com", 1, true) or (string.find)(l_0_9, ".googleusercontent.com", 1, true) or (string.find)(l_0_9, "https://lnkd.", 1, true) or (string.find)(l_0_9, "github.", 1, true) or (string.find)(l_0_9, "raw.githubusercontent", 1, true) or (string.find)(l_0_9, ".licdn.com", 1, true) then
            local l_0_11 = "MAC_BROWSERDOWNLOAD_PATH"
            if l_0_10 then
              TrackPidAndTechnique(l_0_10, "T1566.002", "InitialAccess_Phishing_SpearphishingLink")
              ;
              (MpCommon.BmTriggerSig)(l_0_10, "BM_SUSPFILE_SPEARPHISHING_LINK", l_0_2)
            end
            AppendToRollingQueue(l_0_11, "mac_browserdownload_path", l_0_2, 7200, 100, 0)
            return mp.INFECTED
          end
          do return mp.CLEAN end
          -- DECOMPILER ERROR at PC244: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC244: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC244: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

