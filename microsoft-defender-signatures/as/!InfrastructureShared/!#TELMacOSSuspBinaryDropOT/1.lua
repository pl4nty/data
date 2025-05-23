-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspBinaryDropOT\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.GetCertificateInfo)()
if #l_0_1 > 0 and l_0_1 ~= nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil or l_0_3 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_5 = l_0_2 .. "/" .. l_0_3
if (string.find)(l_0_2, "/private/tmp", 1, true) == 1 or (string.find)(l_0_2, "/private/var", 1, true) == 1 or (string.find)(l_0_2, "/private/etc", 1, true) == 1 or (string.find)(l_0_2, "/library", 1, true) == 1 or (string.find)(l_0_2, "/users/", 1, true) == 1 or (string.find)(l_0_2, "/volumes/", 1, true) == 1 or (string.find)(l_0_2, "/usr/local", 1, true) == 1 then
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC172: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC173: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC174: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC175: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC177: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC178: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC179: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC180: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC181: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC182: Overwrote pending register: R8 in 'AssignReg'

  for l_0_10,l_0_11 in ("visualstudio")("adobe") do
    -- DECOMPILER ERROR at PC185: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC187: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC188: Overwrote pending register: R14 in 'AssignReg'

    if (("jobinfo").match)("chrome", "pdf") then
      (mp.set_mpattribute)("BM_MacBinaryMasquerading")
      -- DECOMPILER ERROR at PC202: Overwrote pending register: R15 in 'AssignReg'

      if l_0_4 then
        (MpCommon.BmTriggerSig)(l_0_4, "BM_MacBinaryMasquerading", "discord")
        TrackPidAndTechnique(l_0_4, "T1036.005", "DefenseEvasion_Masquerading_ExecWitPopularName")
      end
      return mp.INFECTED
    end
    local l_0_12 = l_0_3:gsub("%W", "")
    if (string.match)(l_0_12, l_0_11) then
      (mp.set_mpattribute)("BM_MacBinaryMasquerading")
      -- DECOMPILER ERROR at PC233: Overwrote pending register: R16 in 'AssignReg'

      if l_0_4 then
        (MpCommon.BmTriggerSig)(l_0_4, "BM_MacBinaryMasquerading", "word")
        TrackPidAndTechnique(l_0_4, "T1036.005", "DefenseEvasion_Masquerading_ExecWitPopularName")
      end
      return mp.INFECTED
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC246: Overwrote pending register: R6 in 'AssignReg'

    do return l_0_6 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

