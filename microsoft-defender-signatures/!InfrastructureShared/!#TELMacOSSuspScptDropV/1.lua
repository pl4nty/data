-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspScptDropV\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "/bin/", 1, true) == 1 or (((string.find)(l_0_1, "/usr/", 1, true) == 1 and not (string.find)(l_0_1, "/usr/local/", 1, true) == 1) or (string.find)(l_0_1, "/applications/microsoft defender.app/", 1, true) == 1) then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
do
  if (string.find)(l_0_1, "/contents/macos/", 1, true) then
    local l_0_3 = (string.match)(l_0_1, "(.-)/contents")
    if (string.find)(l_0_3, ".app", -4, true) then
      (mp.set_mpattribute)("BM_ScriptPartOfApp")
      if l_0_2 then
        (MpCommon.BmTriggerSig)(l_0_2, "BM_ScriptPartOfApp", l_0_1)
      end
      return mp.CLEAN
    else
      ;
      (mp.set_mpattribute)("BM_ScriptPartOfBundleWithoutAppExt")
      if l_0_2 then
        (MpCommon.BmTriggerSig)(l_0_2, "BM_ScriptPartOfBundleWithoutAppExt", l_0_1)
        TrackPidAndTechnique(l_0_2, "T1036.005", "DefenseEvasion_Masquerading_AppBundle")
      end
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

