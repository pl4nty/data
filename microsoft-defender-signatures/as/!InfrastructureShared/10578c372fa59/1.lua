-- Threat: !InfrastructureShared
-- Name: 10578c372fa59
-- Type: 21

if peattributes.isexe == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
