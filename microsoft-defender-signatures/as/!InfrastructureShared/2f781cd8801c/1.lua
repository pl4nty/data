-- Threat: !InfrastructureShared
-- Name: 2f781cd8801c
-- Type: 21

if peattributes.isexe == true and pesecs[1].Name == "kkrunchy" and pesecs[1].Characteristics == 3758096608 and mp.getfilesize() >= 70000 and mp.getfilesize() <= 90000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
