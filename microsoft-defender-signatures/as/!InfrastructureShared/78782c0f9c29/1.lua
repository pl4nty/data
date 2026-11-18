-- Threat: !InfrastructureShared
-- Name: 78782c0f9c29
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
