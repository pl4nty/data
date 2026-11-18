-- Threat: !InfrastructureShared
-- Name: 7f786b142dfb
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
