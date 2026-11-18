-- Threat: !InfrastructureShared
-- Name: 62780d4ae279
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
