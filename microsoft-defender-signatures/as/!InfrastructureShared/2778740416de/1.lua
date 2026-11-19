-- Threat: !InfrastructureShared
-- Name: 2778740416de
-- Type: 21

local l_0_0 = mp.GetCertificateInfo()
if peattributes.isdll == true or peattributes.isexe == true then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
