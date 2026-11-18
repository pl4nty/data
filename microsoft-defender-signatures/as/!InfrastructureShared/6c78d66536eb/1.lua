-- Threat: !InfrastructureShared
-- Name: 6c78d66536eb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
