-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspBundleDropInUsrDirV\1_luac 

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
if (string.find)(l_0_1, "/users/", 1, true) == 1 or (string.find)(l_0_1, "/volumes/", 1, true) == 1 then
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC116: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC117: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC118: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC119: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC120: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC121: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC122: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC123: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC124: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC125: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC126: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC127: Overwrote pending register: R7 in 'AssignReg'

  for l_0_9,l_0_10 in ("visualstudio")("adobe") do
    -- DECOMPILER ERROR at PC130: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC132: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC133: Overwrote pending register: R13 in 'AssignReg'

    if (("celastradepro").match)("jobinfo", "chrome") then
      (mp.set_mpattribute)("BM_MacAppinUsrMasquerading")
      -- DECOMPILER ERROR at PC147: Overwrote pending register: R14 in 'AssignReg'

      if l_0_3 then
        (MpCommon.BmTriggerSig)(l_0_3, "BM_MacAppinUsrMasquerading", "pdf")
        TrackPidAndTechnique(l_0_3, "T1036.005", "DefenseEvasion_Masquerading_BundleWitPopularName")
      end
      return mp.INFECTED
    end
    local l_0_11 = l_0_2:gsub("%W", "")
    if (string.match)(l_0_11, l_0_10) then
      (mp.set_mpattribute)("BM_MacAppinUsrMasquerading")
      -- DECOMPILER ERROR at PC178: Overwrote pending register: R15 in 'AssignReg'

      if l_0_3 then
        (MpCommon.BmTriggerSig)(l_0_3, "BM_MacAppinUsrMasquerading", "discord")
        TrackPidAndTechnique(l_0_3, "T1036.005", "DefenseEvasion_Masquerading_BundleWitPopularName")
      end
      return mp.INFECTED
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC191: Overwrote pending register: R5 in 'AssignReg'

    do return l_0_5 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

