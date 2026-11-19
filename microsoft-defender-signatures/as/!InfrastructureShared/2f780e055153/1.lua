-- Threat: !InfrastructureShared
-- Name: 2f780e055153
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
