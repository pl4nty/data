-- Threat: !InfrastructureShared
-- Name: 69611c66c8e6
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
