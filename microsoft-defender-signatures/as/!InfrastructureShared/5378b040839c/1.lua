-- Threat: !InfrastructureShared
-- Name: 5378b040839c
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
