-- Threat: !InfrastructureShared
-- Name: 6f78296e65ce
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
