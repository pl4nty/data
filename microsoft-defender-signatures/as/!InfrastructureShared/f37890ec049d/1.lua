-- Threat: !InfrastructureShared
-- Name: f37890ec049d
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 2400000 and mp.getfilesize() < 2600000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
