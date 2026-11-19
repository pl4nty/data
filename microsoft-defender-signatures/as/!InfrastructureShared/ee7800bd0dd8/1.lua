-- Threat: !InfrastructureShared
-- Name: ee7800bd0dd8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
