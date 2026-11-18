-- Threat: !InfrastructureShared
-- Name: b37889ce5f7e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
