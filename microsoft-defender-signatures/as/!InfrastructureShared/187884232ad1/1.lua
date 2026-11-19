-- Threat: !InfrastructureShared
-- Name: 187884232ad1
-- Type: 21

if peattributes.is_process then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:UpatreFragA_Nonprocess")
return mp.CLEAN
