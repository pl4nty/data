-- Threat: !InfrastructureShared
-- Name: 27785d7aa620
-- Type: 21

if pesecs[6].Name == ".Sharper" and pesecs[7].Name == ".Sharper" and pesecs[8].Name == ".Sharper" and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
