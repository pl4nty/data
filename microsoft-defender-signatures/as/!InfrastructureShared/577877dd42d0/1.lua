-- Threat: !InfrastructureShared
-- Name: 577877dd42d0
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
