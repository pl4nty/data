-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSNetworkConfDiscoveryA!getifaddr\0x000002f2_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 5 then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 then
  TrackPidAndTechnique(l_0_1, "T1016", "Discovery_NetworkConfDiscovery_Getifaddr")
  ;
  (MpCommon.BmTriggerSig)(l_0_1, "BM_PYGETIFADDR", l_0_0)
end
return mp.INFECTED

