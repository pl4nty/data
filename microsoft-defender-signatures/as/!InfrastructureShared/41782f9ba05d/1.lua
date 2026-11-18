-- Threat: !InfrastructureShared
-- Name: 41782f9ba05d
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
