-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanDownloaderNPMTmpDetachedExecA\1.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 10240 then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("SCPT:NpmY_ReqHttp") and not (mp.get_mpattribute)("SCPT:NpmY_ReqAxios") and not (mp.get_mpattribute)("SCPT:NpmY_ReqNodeFetch") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("(SCPT:NpmY_Exec_Exec|SCPT:NpmY_Exec_ExecSync|SCPT:NpmY_Exec_ExecFile|SCPT:NpmY_Exec_Spawn|SCPT:NpmY_Exec_SpawnSync)") then
  return mp.CLEAN
end
return mp.INFECTED

