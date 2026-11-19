-- Threat: !InfrastructureShared
-- Name: af78d49b1a52
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
