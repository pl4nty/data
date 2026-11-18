-- Threat: !InfrastructureShared
-- Name: e4789b60e91f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
