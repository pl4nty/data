-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\96b32f83b219\1_luac 

-- params : ...
-- function num : 0
if (MpCommon.QuerySessionInformation)(((bm.get_current_process_startup_info)()).ppid, MpCommon.WTSIsRemoteSession) then
  return mp.INFECTED
end
return mp.CLEAN

