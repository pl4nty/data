-- Threat: !InfrastructureShared
-- Name: 4178340dff3e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
