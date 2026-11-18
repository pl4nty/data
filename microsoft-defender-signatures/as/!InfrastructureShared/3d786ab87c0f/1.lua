-- Threat: !InfrastructureShared
-- Name: 3d786ab87c0f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
