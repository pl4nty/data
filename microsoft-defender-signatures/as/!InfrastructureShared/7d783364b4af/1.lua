-- Threat: !InfrastructureShared
-- Name: 7d783364b4af
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.getfilesize() > 3999 and mp.getfilesize() < 4100 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
