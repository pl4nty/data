-- Threat: !InfrastructureShared
-- Name: 55412a9686cd
-- Type: 21

if string.lower(pe.get_versioninfo().CompanyName) == "project: sakura-editor" then
  return mp.INFECTED
end
local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
return mp.CLEAN
