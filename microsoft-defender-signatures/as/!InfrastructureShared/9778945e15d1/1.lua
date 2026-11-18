-- Threat: !InfrastructureShared
-- Name: 9778945e15d1
-- Type: 21

if pehdr.NumberOfSections >= 6 and (pesecs[6].Name == ".stalin0" or pesecs[6].Name == ".biden01" or pesecs[6].Name == ".kimon13" or pesecs[6].Name == ".digga01" or pesecs[6].Name == ".borat0" or pesecs[6].Name == ".fakit0") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
