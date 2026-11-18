-- Threat: !InfrastructureShared
-- Name: 5778b606448c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
