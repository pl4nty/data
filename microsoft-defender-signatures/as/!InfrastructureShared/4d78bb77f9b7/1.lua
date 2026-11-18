-- Threat: !InfrastructureShared
-- Name: 4d78bb77f9b7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
