-- Threat: !InfrastructureShared
-- Name: 4d78f9bc623c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
