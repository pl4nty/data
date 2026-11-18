-- Threat: !InfrastructureShared
-- Name: c97842905226
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  local l_0_0 = mp.GetCertificateInfo()
  if l_0_0 ~= nil and 0 < #l_0_0 and mp.IsTrustedFile() then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
