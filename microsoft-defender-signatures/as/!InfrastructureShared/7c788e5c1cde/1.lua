-- Threat: !InfrastructureShared
-- Name: 7c788e5c1cde
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
