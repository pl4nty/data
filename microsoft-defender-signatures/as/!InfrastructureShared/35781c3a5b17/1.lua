-- Threat: !InfrastructureShared
-- Name: 35781c3a5b17
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
