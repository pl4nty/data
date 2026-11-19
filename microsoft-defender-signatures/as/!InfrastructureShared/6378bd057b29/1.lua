-- Threat: !InfrastructureShared
-- Name: 6378bd057b29
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
