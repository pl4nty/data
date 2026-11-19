-- Threat: !InfrastructureShared
-- Name: 2f78ea185df3
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true and mp.getfilesize() > 5000000 and pesecs[9].Name == ".tls" and pesecs[9].Characteristics == 3221225536 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
