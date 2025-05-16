-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspExecDropV\0x00000953_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_1, "/bin/", 1, true) == 1 or (((string.find)(l_0_1, "/usr/", 1, true) == 1 and not (string.find)(l_0_1, "/usr/local/", 1, true) == 1) or (string.find)(l_0_1, "/applications/microsoft defender.app/", 1, true) == 1) then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_4 = l_0_1 .. "/" .. l_0_2
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC142: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC143: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC144: Overwrote pending register: R7 in 'AssignReg'

  for l_0_9,l_0_10 in ("launchd")("launchctl") do
    -- DECOMPILER ERROR at PC149: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC151: Overwrote pending register: R12 in 'AssignReg'

    if l_0_2 == l_0_10 then
      (("curl").set_mpattribute)("xattr")
      -- DECOMPILER ERROR at PC158: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC159: Overwrote pending register: R14 in 'AssignReg'

      if l_0_3 then
        (MpCommon.BmTriggerSig)(l_0_3, "crontab", "configd")
        TrackPidAndTechnique(l_0_3, "T1036.005", "DefenseEvasion_Masquerading_ExecWitExactLegitName")
      end
      return mp.INFECTED
    end
    local l_0_11 = l_0_2:gsub("%W", "")
    if l_0_11 == l_0_10 then
      (mp.set_mpattribute)("BM_MacMasquerading")
      -- DECOMPILER ERROR at PC185: Overwrote pending register: R15 in 'AssignReg'

      if l_0_3 then
        (MpCommon.BmTriggerSig)(l_0_3, "BM_MacMasquerading", "syslog")
        TrackPidAndTechnique(l_0_3, "T1036.005", "DefenseEvasion_Masquerading_ExecWitExactLegitName")
      end
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

