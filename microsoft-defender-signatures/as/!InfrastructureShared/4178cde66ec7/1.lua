-- Threat: !InfrastructureShared
-- Name: 4178cde66ec7
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true and pesecs[5].Name == ".rsrc" and pesecs[5].Characteristics == 1073741888 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
