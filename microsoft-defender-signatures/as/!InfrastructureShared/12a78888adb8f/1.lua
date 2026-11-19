-- Threat: !InfrastructureShared
-- Name: 12a78888adb8f
-- Type: 21

if peattributes.isexe == true and pesecs[1].Name == ".xcc22eb" and pesecs[1].Characteristics == 3758096416 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
