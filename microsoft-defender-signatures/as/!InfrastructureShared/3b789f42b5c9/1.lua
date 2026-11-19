-- Threat: !InfrastructureShared
-- Name: 3b789f42b5c9
-- Type: 21

if peattributes.no_security and mp.getfilesize() > 250000 and mp.getfilesize() < 450000 and peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/LummaStealer.KK1!MTB") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
