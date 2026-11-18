-- Threat: !InfrastructureShared
-- Name: 3d782752f1d4
-- Type: 21

if peattributes.isexe == true and pesecs[1].Name == "odyqx" and pesecs[1].Characteristics == 3758096512 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
