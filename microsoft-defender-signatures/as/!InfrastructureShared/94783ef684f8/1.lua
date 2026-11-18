-- Threat: !InfrastructureShared
-- Name: 94783ef684f8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
