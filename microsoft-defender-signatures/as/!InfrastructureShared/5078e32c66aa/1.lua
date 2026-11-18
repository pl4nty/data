-- Threat: !InfrastructureShared
-- Name: 5078e32c66aa
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
