-- Threat: !InfrastructureShared
-- Name: 45400259650f
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
