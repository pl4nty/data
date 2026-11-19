-- Threat: !InfrastructureShared
-- Name: 49788f0b5f01
-- Type: 21

if peattributes.no_security and mp.get_mpattribute("NID:Trojan:Win32/Fragtor.LMC!MTB") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
