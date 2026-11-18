-- Threat: !InfrastructureShared
-- Name: 89784084ab97
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 9 and mp.getfilesize() < 192000 and mp.getfilesize() > 183000 and pesecs[9].Name == ".rcd7cb" then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
