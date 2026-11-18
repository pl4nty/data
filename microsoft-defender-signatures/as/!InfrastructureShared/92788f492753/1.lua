-- Threat: !InfrastructureShared
-- Name: 92788f492753
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
