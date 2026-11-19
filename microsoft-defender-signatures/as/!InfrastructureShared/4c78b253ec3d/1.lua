-- Threat: !InfrastructureShared
-- Name: 4c78b253ec3d
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.getfilesize() < 95000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
