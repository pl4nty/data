-- Threat: !InfrastructureShared
-- Name: 5c7898554eb8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
