-- Threat: !InfrastructureShared
-- Name: c878182de222
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
