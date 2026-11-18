-- Threat: !InfrastructureShared
-- Name: 1b78b6574707
-- Type: 21

if peattributes.is_process then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:UpatreFragB_Nonprocess")
return mp.CLEAN
