-- Threat: !InfrastructureShared
-- Name: 63787bb49f3d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
