-- Threat: !InfrastructureShared
-- Name: c5783b534f40
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
