-- Threat: !InfrastructureShared
-- Name: !#SLF:TrojanDownloader:NPM/TmpDetachedExec.A
-- Type: 13
-- MpAttributes: SCPT:NpmJS & SCPT:NpmY_ReqChildProc & SCPT:NpmY_Detached & (SCPT:NpmY_TmpDirCall | SCPT:NpmY_TmpPath)

local l_0_0 = mp.getfilesize()
if 10240 < l_0_0 then
  return mp.CLEAN
end
if not mp.get_mpattribute("SCPT:NpmY_ReqHttp") and not mp.get_mpattribute("SCPT:NpmY_ReqAxios") and not mp.get_mpattribute("SCPT:NpmY_ReqNodeFetch") then
  return mp.CLEAN
end
if not mp.get_mpattribute("SCPT:NpmY_Exec_ExecSync") and not mp.get_mpattribute("SCPT:NpmY_Exec_ExecFile") and not mp.get_mpattribute("SCPT:NpmY_Exec_Spawn") and not mp.get_mpattribute("SCPT:NpmY_Exec_SpawnSync") then
  return mp.CLEAN
end
return mp.INFECTED
