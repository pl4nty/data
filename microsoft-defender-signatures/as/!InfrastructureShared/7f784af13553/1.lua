-- Threat: !InfrastructureShared
-- Name: 7f784af13553
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
