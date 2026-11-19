-- Threat: !InfrastructureShared
-- Name: ba7804808f4b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
