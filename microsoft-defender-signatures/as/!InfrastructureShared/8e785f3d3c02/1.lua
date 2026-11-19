-- Threat: !InfrastructureShared
-- Name: 8e785f3d3c02
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
