-- Threat: !InfrastructureShared
-- Name: 4478b4ed776f
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image == true and pesecs[2].Name == ".data" and pesecs[2].Characteristics == 3221225536 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
