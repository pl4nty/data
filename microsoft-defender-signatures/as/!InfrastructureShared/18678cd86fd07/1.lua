-- Threat: !InfrastructureShared
-- Name: 18678cd86fd07
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
