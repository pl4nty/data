-- Threat: !InfrastructureShared
-- Name: 10d78ca637c02
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 8000 and mp.getfilesize() < 11000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
