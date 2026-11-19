-- Threat: !InfrastructureShared
-- Name: 387894bea6d3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
