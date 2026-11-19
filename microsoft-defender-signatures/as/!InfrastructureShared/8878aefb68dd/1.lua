-- Threat: !InfrastructureShared
-- Name: 8878aefb68dd
-- Type: 21

if pehdr.NumberOfSections == 8 and pesecs[5].Name == ".xdata" and pesecs[5].Characteristics == 1073741888 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
