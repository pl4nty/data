-- Threat: !InfrastructureShared
-- Name: d778b7b9330d
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 8800000 and mp.getfilesize() < 8900000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
