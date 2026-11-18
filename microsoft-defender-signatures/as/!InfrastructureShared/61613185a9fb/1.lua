-- Threat: !InfrastructureShared
-- Name: 61613185a9fb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
