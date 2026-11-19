-- Threat: !InfrastructureShared
-- Name: a2789d77b7e7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
