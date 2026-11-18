-- Threat: !InfrastructureShared
-- Name: cf78880cbc6a
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 5000000 and mp.getfilesize() < 6000000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
