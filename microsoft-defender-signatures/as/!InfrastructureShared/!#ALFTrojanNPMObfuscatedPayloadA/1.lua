-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:NPM/ObfuscatedPayload.A
-- Type: 13
-- MpAttributes: SCPT:NpmJS & (SCPT:NpmY_Exec_Exec | SCPT:NpmY_Exec_ExecSync | SCPT:NpmY_Exec_ExecFile | SCPT:NpmY_Exec_Spawn | SCPT:NpmY_Exec_SpawnSync)

local l_0_0 = mp.getfilesize()
if 153600 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(tostring(l_0_1))
local l_0_2, l_0_3 = string.gsub(l_0_1, "parseint%(", "")
if l_0_3 < 6 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = string.gsub(l_0_1, "_?0x%x%x%x", "")
if l_0_5 < 100 then
  return mp.CLEAN
end
if not mp.get_mpattribute("SCPT:NpmY_ReqHttp") and not mp.get_mpattribute("SCPT:NpmY_ReqAxios") and not mp.get_mpattribute("SCPT:NpmY_ReqNodeFetch") and not mp.get_mpattribute("SCPT:NpmY_ReqDns") then
  return mp.CLEAN
end
return mp.INFECTED
