-- Threat: !InfrastructureShared
-- Name: 50786fd2861e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
