-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSDeobfuscateDecodeA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
if (string.find)(l_0_1, "/library/developer/commandlinetools/library/frameworks/python3.framework/versions/%d%.%d/lib/", 1) == 1 then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
if l_0_0 then
  TrackPidAndTechnique(l_0_0, "T1140", "DefenseEvasion_DeobfuscateDecodeFilesInfo_base64aes")
  ;
  (MpCommon.BmTriggerSig)(l_0_0, "BM_DeobfuscateDecode", l_0_1)
end
return mp.INFECTED

