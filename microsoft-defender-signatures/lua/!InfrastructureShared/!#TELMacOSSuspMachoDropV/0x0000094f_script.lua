-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspMachoDropV\0x0000094f_luac 

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
local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if (string.find)(l_0_2, "->(macho-unibin-", 1, true) then
  l_0_2 = l_0_2:gsub("%->%(macho%-unibin%-.*", "")
end
if l_0_2 == nil or #l_0_2 < 5 then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_3, "->(MachO-UniBin-", 1, true) then
  l_0_3 = l_0_3:gsub("%->%(MachO%-UniBin%-.*", "")
end
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
do
  if (string.find)(l_0_2, "/contents/macos/", 1, true) then
    local l_0_5 = (string.match)(l_0_2, "(.-)/contents")
    if (string.find)(l_0_5, ".app", -4, true) then
      (mp.set_mpattribute)("BM_MachoPartOfApp")
      if l_0_4 then
        (MpCommon.BmTriggerSig)(l_0_4, "BM_MachoPartOfApp", l_0_2)
      end
      return mp.CLEAN
    else
      ;
      (mp.set_mpattribute)("BM_MachoPartOfBundleWithoutAppExt")
      if l_0_4 then
        (MpCommon.BmTriggerSig)(l_0_4, "BM_MachoPartOfBundleWithoutAppExt", l_0_3)
        TrackPidAndTechnique(l_0_4, "T1036.005", "DefenseEvasion_Masquerading_AppBundle")
      end
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

