-- Threat: !InfrastructureShared
-- Name: 73786e44441d
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
