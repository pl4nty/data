-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:NPM/PocExfil.A
-- Type: 13
-- MpAttributes: SCPT:NpmJS & (SCPT:NpmY_Poc_Oastify | SCPT:NpmY_Poc_Burp | SCPT:NpmY_Poc_Interactsh | SCPT:NpmY_Poc_Pipedream | SCPT:NpmY_Poc_RequestBin | SCPT:NpmY_Poc_HackTask | SCPT:NpmY_Poc_WebhookSite | SCPT:NpmY_Poc_Canary | (SCPT:NpmY_Poc_OastMe | SCPT:NpmY_Poc_OastPro | SCPT:NpmY_Poc_OastLive | SCPT:NpmY_Poc_OastSite | SCPT:NpmY_Poc_OastOnline | SCPT:NpmY_Poc_OastFun))

local l_0_0 = mp.getfilesize()
if 51200 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = {
  "SCPT:NpmY_Collect_Hostname",
  "SCPT:NpmY_Collect_UserInfo",
  "SCPT:NpmY_Collect_NetIfaces",
  "SCPT:NpmY_Collect_Cwd",
  "SCPT:NpmY_Serialize_EnvJson"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if mp.get_mpattribute(l_0_4) then
    l_0_1 = l_0_1 + 1
  end
end
if l_0_1 < 1 then
  return mp.CLEAN
end
if not mp.get_mpattribute("SCPT:NpmY_ReqHttp") and not mp.get_mpattribute("SCPT:NpmY_ReqAxios") and not mp.get_mpattribute("SCPT:NpmY_ReqNodeFetch") and not mp.get_mpattribute("SCPT:NpmY_ReqDns") then
  return mp.CLEAN
end
return mp.INFECTED
