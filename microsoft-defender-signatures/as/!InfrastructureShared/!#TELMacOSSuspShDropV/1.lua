-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspShDropV\1.luac 

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
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_4 = l_0_1 .. "/" .. l_0_2
if (string.find)(l_0_1, "/private/tmp", 1, true) == 1 or (string.find)(l_0_1, "/private/var", 1, true) == 1 or (string.find)(l_0_1, "/private/etc", 1, true) == 1 or (string.find)(l_0_1, "/library", 1, true) == 1 or (string.find)(l_0_1, "/users/", 1, true) == 1 or (string.find)(l_0_1, "/volumes/", 1, true) == 1 or (string.find)(l_0_1, "/usr/local", 1, true) == 1 then
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC161: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC162: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC163: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC164: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC165: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC166: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC169: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC170: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC171: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC172: Overwrote pending register: R7 in 'AssignReg'

  for l_0_9,l_0_10 in ("visualstudio")("adobe") do
    -- DECOMPILER ERROR at PC175: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC177: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC178: Overwrote pending register: R13 in 'AssignReg'

    if (("celastradepro").match)("jobinfo", "chrome") then
      (mp.set_mpattribute)("BM_MacShMasquerading")
      -- DECOMPILER ERROR at PC192: Overwrote pending register: R14 in 'AssignReg'

      if l_0_3 then
        (MpCommon.BmTriggerSig)(l_0_3, "BM_MacShMasquerading", "pdf")
        TrackPidAndTechnique(l_0_3, "T1036.005", "DefenseEvasion_Masquerading_ExecWitPopularName")
      end
      return mp.INFECTED
    end
    local l_0_11 = l_0_2:gsub("%W", "")
    if (string.match)(l_0_11, l_0_10) then
      (mp.set_mpattribute)("BM_MacShMasquerading")
      -- DECOMPILER ERROR at PC223: Overwrote pending register: R15 in 'AssignReg'

      if l_0_3 then
        (MpCommon.BmTriggerSig)(l_0_3, "BM_MacShMasquerading", "discord")
        TrackPidAndTechnique(l_0_3, "T1036.005", "DefenseEvasion_Masquerading_ExecWitPopularName")
      end
      return mp.INFECTED
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC236: Overwrote pending register: R5 in 'AssignReg'

    do return l_0_5 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

