-- Threat: !InfrastructureShared
-- Name: !#SLF:PWS:NPM/N8nStealer.A
-- Type: 13
-- MpAttributes: SCPT:NpmJS & (SCPT:NpmY_Imds_Aws | SCPT:NpmY_Imds_Gcp | SCPT:NpmY_Imds_Ecs) & SCPT:NpmY_DevNullSuppress

local l_0_0 = mp.getfilesize()
if 30720 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = {
  "SCPT:NpmY_N8n_Db",
  "SCPT:NpmY_N8n_CredEntity",
  "SCPT:NpmY_N8n_EncKey",
  "SCPT:NpmY_N8n_Config"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if mp.get_mpattribute(l_0_4) then
    l_0_1 = l_0_1 + 1
  end
end
if l_0_1 < 2 then
  return mp.CLEAN
end
local l_0_5 = 0
local l_0_6 = {
  "SCPT:NPMCreds_Cred_AwsCred",
  "SCPT:NPMCreds_Cred_SshIdrsa",
  "SCPT:NpmY_CredPath_SaToken",
  "SCPT:NPMCreds_Cred_DockerConfig",
  "SCPT:NPMCreds_Cred_SshIdEd25519",
  "SCPT:NpmY_Collect_Npmrc"
}
for l_0_7, l_0_8 in ipairs(l_0_6) do
  if mp.get_mpattribute(l_0_8) then
    l_0_5 = l_0_5 + 1
  end
end
if l_0_5 < 2 then
  return mp.CLEAN
end
return mp.INFECTED
