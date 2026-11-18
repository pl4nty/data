-- Threat: !InfrastructureShared
-- Name: 11b7808e07fd9
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1500000 and mp.getfilesize() < 2500000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
