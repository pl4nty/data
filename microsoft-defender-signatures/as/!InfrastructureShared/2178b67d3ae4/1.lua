-- Threat: !InfrastructureShared
-- Name: 2178b67d3ae4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
