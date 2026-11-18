-- Threat: !InfrastructureShared
-- Name: 65782dd7345f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
