-- Threat: !InfrastructureShared
-- Name: 128788e87e83f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
