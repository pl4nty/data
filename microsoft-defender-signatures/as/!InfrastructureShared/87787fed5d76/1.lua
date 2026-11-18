-- Threat: !InfrastructureShared
-- Name: 87787fed5d76
-- Type: 21

if peattributes.isdll == true and pehdr.NumberOfSections > 10 and pesecs[5].Name == ".xdata" and pesecs[5].Characteristics == 1073741888 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
