-- Threat: !InfrastructureShared
-- Name: cb787f9b6f25
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
