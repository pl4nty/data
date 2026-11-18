-- Threat: !InfrastructureShared
-- Name: a7a9ab42bc14
-- Type: 21

local l_0_0 = nri.GetSSLCertificate()
if l_0_0 and l_0_0.Subject == l_0_0.Issuer then
  local l_0_1 = l_0_0.Subject
  local l_0_2, l_0_3, l_0_4 = string.match(l_0_1, ", OU=(.+), CN=(.+), EMAIL=(.+)")
  if l_0_4 == l_0_2 .. "@" .. l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
