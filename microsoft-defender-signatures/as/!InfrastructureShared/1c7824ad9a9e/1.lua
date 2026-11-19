-- Threat: !InfrastructureShared
-- Name: 1c7824ad9a9e
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true and pesecs[pehdr.NumberOfSections].Characteristics == 3758096416 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
