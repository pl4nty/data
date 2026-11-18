-- Threat: !InfrastructureShared
-- Name: 2578dbc07ae1
-- Type: 21

if peattributes.isdll == true and pesecs[3].Name == "hydrated" and pesecs[3].Characteristics == 3221225600 and peattributes.hasexports == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
