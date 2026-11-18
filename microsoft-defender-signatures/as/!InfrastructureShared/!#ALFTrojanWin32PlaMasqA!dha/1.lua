-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/PlaMasq.A!dha
-- Type: 9
-- MpAttributes: !PEPCODE:HasDigitalSignature

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil then
  if l_0_0.CompanyName ~= "Intel Corporation" then
    return mp.CLEAN
  end
  if l_0_0.ProductName == "Intel(R) Chipset Device Software" then
    return mp.INFECTED
  end
end
return mp.CLEAN
