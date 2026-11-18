-- Threat: !InfrastructureShared
-- Name: 4e78461f7ccd
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= nil and mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
if peattributes.no_security == true then
  local l_0_1 = mp.GetCertificateInfo()
  for l_0_2, l_0_3 in pairs(l_0_1) do
    if l_0_3.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
