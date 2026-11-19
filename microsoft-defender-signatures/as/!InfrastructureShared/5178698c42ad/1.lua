-- Threat: !InfrastructureShared
-- Name: 5178698c42ad
-- Type: 21

if peattributes.isdll == true and pesecs[50].Name == ".idata" and pesecs[50].Characteristics == 3221225536 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
