-- Threat: !InfrastructureShared
-- Name: 6578d3e4d4e5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
