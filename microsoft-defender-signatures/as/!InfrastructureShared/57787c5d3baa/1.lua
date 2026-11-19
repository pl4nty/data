-- Threat: !InfrastructureShared
-- Name: 57787c5d3baa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
