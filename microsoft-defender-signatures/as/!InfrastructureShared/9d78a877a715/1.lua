-- Threat: !InfrastructureShared
-- Name: 9d78a877a715
-- Type: 21

if pehdr.NumberOfSections > 10 and pesecs[11].Name == ".rcd7cb" and pesecs[11].Characteristics == 3758096384 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
