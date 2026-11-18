-- Threat: !InfrastructureShared
-- Name: ea789dd5f578
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
