-- Threat: !InfrastructureShared
-- Name: 26784129c7ed
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
if peattributes.isexe == true or peattributes.isdll == true and mp.get_mpattribute("pea_no_security") then
  local l_0_1 = mp.GetCertificateInfo()
  for l_0_2, l_0_3 in pairs(l_0_1) do
    if l_0_3.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
