-- Threat: !InfrastructureShared
-- Name: d6786534c7fe
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
