-- Threat: !InfrastructureShared
-- Name: 150785f141dd1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
