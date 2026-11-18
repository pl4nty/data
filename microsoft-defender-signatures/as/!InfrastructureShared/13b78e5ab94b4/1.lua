-- Threat: !InfrastructureShared
-- Name: 13b78e5ab94b4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
