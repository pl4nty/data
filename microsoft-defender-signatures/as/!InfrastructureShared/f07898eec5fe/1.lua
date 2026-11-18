-- Threat: !InfrastructureShared
-- Name: f07898eec5fe
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
