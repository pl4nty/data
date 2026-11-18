-- Threat: !InfrastructureShared
-- Name: 5f784773fdf2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
