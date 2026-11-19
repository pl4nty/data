-- Threat: !InfrastructureShared
-- Name: a6613f8d3e08
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
