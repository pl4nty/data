-- Threat: !InfrastructureShared
-- Name: 3540976be4f6
-- Type: 21

if string.lower(pe.get_versioninfo().OriginalFilename) == "ultraviewer_service.exe" then
  return mp.CLEAN
end
if peattributes.is_process then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
