-- Threat: !InfrastructureShared
-- Name: 7a8d8dce4096
-- Type: 21

local l_0_0 = mp.GetCertificateInfo()
if #l_0_0 < 1 or l_0_0 == nil then
  return mp.INFECTED
end
return mp.CLEAN
