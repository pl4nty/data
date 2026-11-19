-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:NPM/EnvDumpExfil.A
-- Type: 13
-- MpAttributes: SCPT:NpmJS & SCPT:NpmY_Serialize_EnvJson

local l_0_0 = mp.getfilesize()
if 5120 < l_0_0 then
  return mp.CLEAN
end
if mp.get_mpattribute("SCPT:NpmY_ReqHttp") or mp.get_mpattribute("SCPT:NpmY_ReqAxios") or mp.get_mpattribute("SCPT:NpmY_ReqNodeFetch") or mp.get_mpattribute("SCPT:NpmY_ReqDns") then
  return mp.INFECTED
end
return mp.CLEAN
