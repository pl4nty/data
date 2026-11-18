-- Threat: !InfrastructureShared
-- Name: a378fe55a4a2
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
