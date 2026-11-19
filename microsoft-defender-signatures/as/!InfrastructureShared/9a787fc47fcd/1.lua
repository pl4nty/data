-- Threat: !InfrastructureShared
-- Name: 9a787fc47fcd
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
