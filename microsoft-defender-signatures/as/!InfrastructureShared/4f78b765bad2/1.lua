-- Threat: !InfrastructureShared
-- Name: 4f78b765bad2
-- Type: 21

if pehdr.NumberOfSections == 7 and pesecs[6].Name == ".reloc" and pesecs[6].Characteristics == 1107296320 and pesecs[7].Characteristics == 3758096384 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
