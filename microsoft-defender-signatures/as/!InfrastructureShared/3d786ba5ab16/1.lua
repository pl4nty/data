-- Threat: !InfrastructureShared
-- Name: 3d786ba5ab16
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
