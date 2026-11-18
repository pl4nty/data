-- Threat: !InfrastructureShared
-- Name: 2d78b0501d9e
-- Type: 21

if peattributes.isexe == true and pehdr.Machine == 34404 and mp.getfilesize() < 500000 and mp.getfilesize() > 200000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
