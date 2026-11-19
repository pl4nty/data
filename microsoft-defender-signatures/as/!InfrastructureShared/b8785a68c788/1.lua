-- Threat: !InfrastructureShared
-- Name: b8785a68c788
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
