-- Threat: !InfrastructureShared
-- Name: 6a787e00592f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
