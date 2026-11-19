-- Threat: !InfrastructureShared
-- Name: a3783c1a8b17
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
