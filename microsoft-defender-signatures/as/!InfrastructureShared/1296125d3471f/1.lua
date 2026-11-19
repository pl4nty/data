-- Threat: !InfrastructureShared
-- Name: 1296125d3471f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
