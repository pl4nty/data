-- Threat: !InfrastructureShared
-- Name: 2278d18e5dd7
-- Type: 21

if peattributes.is_process then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:UpatreFragC_Nonprocess")
return mp.CLEAN
