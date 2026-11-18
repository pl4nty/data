-- Threat: !InfrastructureShared
-- Name: 2878092cc4ca
-- Type: 21

if peattributes.no_security and mp.get_mpattribute("NID:Trojan:Win32/Emotet.LM!MTB") and mp.getfilesize() > 200000 and mp.getfilesize() < 300000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
