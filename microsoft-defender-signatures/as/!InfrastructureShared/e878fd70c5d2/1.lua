-- Threat: !InfrastructureShared
-- Name: e878fd70c5d2
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 13000 and mp.getfilesize() < 15000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
