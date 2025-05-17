-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspDPRKUnsigedMasqueradingV\1_luac 

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
if (string.find)(l_0_3, "->(macho-unibin-", 1, true) then
  l_0_3 = l_0_3:gsub("%->%(macho%-unibin%-.*", "")
end
local l_0_4 = l_0_3:gsub("%s", "")
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_6 = l_0_2 .. "/" .. l_0_3
if IsExcludedByImagePathMacOS(l_0_6) then
  return mp.CLEAN
end
local l_0_7 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_7 == nil or l_0_7 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_7, "->(MachO-UniBin-", 1, true) then
  l_0_7 = l_0_7:gsub("%->%(MachO%-UniBin%-.*", "")
end
if SuspMacPathsToMonitor(l_0_6, true) then
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC153: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC154: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC155: Overwrote pending register: R10 in 'AssignReg'

  for l_0_12,l_0_13 in ("celastradepro")("testspeed") do
    -- DECOMPILER ERROR at PC158: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC160: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC161: Overwrote pending register: R16 in 'AssignReg'

    if (("coingotrade").match)("3cxdesktop", "arialunicode") then
      (mp.set_mpattribute)("BM_MacDPRKMasquerading")
      -- DECOMPILER ERROR at PC175: Overwrote pending register: R17 in 'AssignReg'

      if l_0_5 then
        (MpCommon.BmTriggerSig)(l_0_5, "BM_MacDPRKMasquerading", "beavertail")
        TrackPidAndTechnique(l_0_5, "T1036.005", "DefenseEvasion_Masquerading_BundleWitPopularName")
      end
      return mp.INFECTED
    end
    local l_0_14 = l_0_4:gsub("%W", "")
    if (string.match)(l_0_14, l_0_13) then
      (mp.set_mpattribute)("BM_MacDPRKMasquerading")
      -- DECOMPILER ERROR at PC206: Overwrote pending register: R18 in 'AssignReg'

      if l_0_5 then
        (MpCommon.BmTriggerSig)(l_0_5, "BM_MacDPRKMasquerading", "coinbase")
        TrackPidAndTechnique(l_0_5, "T1036.005", "DefenseEvasion_Masquerading_BundleWitPopularName")
      end
      return mp.INFECTED
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC219: Overwrote pending register: R8 in 'AssignReg'

    do return l_0_8 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

