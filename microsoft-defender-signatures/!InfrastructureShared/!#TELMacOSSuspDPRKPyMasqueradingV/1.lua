-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspDPRKPyMasqueradingV\1.luac 

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
local l_0_3 = l_0_2:gsub("%s", "")
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_5 = l_0_1 .. "/" .. l_0_2
local l_0_6 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_5) then
  return mp.CLEAN
end
if SuspMacPathsToMonitor(l_0_5, true) then
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC114: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC115: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R9 in 'AssignReg'

  for l_0_11,l_0_12 in ("celastradepro")("testspeed") do
    -- DECOMPILER ERROR at PC119: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC121: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC122: Overwrote pending register: R15 in 'AssignReg'

    if (("coingotrade").match)("3cxdesktop", "arialunicode") then
      (mp.set_mpattribute)("BM_MacDPRKMasquerading")
      -- DECOMPILER ERROR at PC136: Overwrote pending register: R16 in 'AssignReg'

      if l_0_4 then
        (MpCommon.BmTriggerSig)(l_0_4, "BM_MacDPRKMasquerading", "beavertail")
        TrackPidAndTechnique(l_0_4, "T1036.005", "DefenseEvasion_Masquerading_BundleWitPopularName")
      end
      return mp.INFECTED
    end
    local l_0_13 = l_0_3:gsub("%W", "")
    if (string.match)(l_0_13, l_0_12) then
      (mp.set_mpattribute)("BM_MacDPRKMasquerading")
      -- DECOMPILER ERROR at PC167: Overwrote pending register: R17 in 'AssignReg'

      if l_0_4 then
        (MpCommon.BmTriggerSig)(l_0_4, "BM_MacDPRKMasquerading", "coinbase")
        TrackPidAndTechnique(l_0_4, "T1036.005", "DefenseEvasion_Masquerading_BundleWitPopularName")
      end
      return mp.INFECTED
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC180: Overwrote pending register: R7 in 'AssignReg'

    do return l_0_7 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

