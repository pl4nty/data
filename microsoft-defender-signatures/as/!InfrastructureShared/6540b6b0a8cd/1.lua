-- Threat: !InfrastructureShared
-- Name: 6540b6b0a8cd
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() > 10485760 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil and l_0_2.Signers.IsValid == true then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
