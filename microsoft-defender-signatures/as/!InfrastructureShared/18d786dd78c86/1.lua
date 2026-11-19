-- Threat: !InfrastructureShared
-- Name: 18d786dd78c86
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.getfilesize() < 167940 and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
