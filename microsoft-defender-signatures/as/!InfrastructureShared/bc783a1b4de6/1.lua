-- Threat: !InfrastructureShared
-- Name: bc783a1b4de6
-- Type: 21

if peattributes.isexe == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
local l_0_3 = pe.get_versioninfo()
if l_0_3 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
