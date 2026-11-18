-- Threat: !InfrastructureShared
-- Name: ae7823c302f9
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
