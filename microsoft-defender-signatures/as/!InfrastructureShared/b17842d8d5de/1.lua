-- Threat: !InfrastructureShared
-- Name: b17842d8d5de
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
