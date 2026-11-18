-- Threat: !InfrastructureShared
-- Name: fc782c0bc500
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
