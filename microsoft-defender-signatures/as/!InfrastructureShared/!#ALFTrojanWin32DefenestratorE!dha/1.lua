-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Defenestrator.E!dha
-- Type: 9
-- MpAttributes: PEPCODE:HasDigitalSignature

local l_0_0 = mp.GetCertificateInfo()
if l_0_0 == nil or #l_0_0 == 0 then
  return mp.CLEAN
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if l_0_2.AuthenticodeContentType ~= "PE" then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2.Certificates
  if l_0_3 ~= nil then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      local l_0_6 = l_0_5.Issuer
      if l_0_6 ~= nil and l_0_6.CommonName ~= nil and mp.utf16to8(l_0_6.CommonName) == "officeupdate.com" then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
