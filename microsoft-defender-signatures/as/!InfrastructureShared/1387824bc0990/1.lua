-- Threat: !InfrastructureShared
-- Name: 1387824bc0990
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 2900000 and mp.getfilesize() < 3000000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
