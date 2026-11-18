-- Threat: !InfrastructureShared
-- Name: a4783f76b0ea
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
