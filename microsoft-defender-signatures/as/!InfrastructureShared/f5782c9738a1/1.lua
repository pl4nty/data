-- Threat: !InfrastructureShared
-- Name: f5782c9738a1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
