-- Threat: !InfrastructureShared
-- Name: 7078b3d3487b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
