-- Threat: !InfrastructureShared
-- Name: e3789181915d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
