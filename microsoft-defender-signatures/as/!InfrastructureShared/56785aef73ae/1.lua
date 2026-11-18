-- Threat: !InfrastructureShared
-- Name: 56785aef73ae
-- Type: 21

if mp.get_mpattribute("TEL:Trojan:Win64/DLLHijack.PB!MTB") and peattributes.isdll == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
