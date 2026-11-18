-- Threat: !InfrastructureShared
-- Name: 27783b696a4b
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win64/Tedy.MVN2!MTB") and (pesecs[pehdr.NumberOfSections].Characteristics == 3758096448 or pesecs[pehdr.NumberOfSections].Characteristics == 3791650880 or pesecs[pehdr.NumberOfSections].Characteristics == 3761242176 or pesecs[pehdr.NumberOfSections].Characteristics == 3794796608 or pesecs[pehdr.NumberOfSections].Characteristics == 3758096480 or pesecs[pehdr.NumberOfSections].Characteristics == 3758096416 or pesecs[pehdr.NumberOfSections].Characteristics == 3791650816) then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
