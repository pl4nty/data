-- Threat: !InfrastructureShared
-- Name: fa78ed6fbcad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
