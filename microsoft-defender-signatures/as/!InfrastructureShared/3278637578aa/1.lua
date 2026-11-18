-- Threat: !InfrastructureShared
-- Name: 3278637578aa
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
