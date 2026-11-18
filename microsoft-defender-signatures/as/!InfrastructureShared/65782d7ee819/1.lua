-- Threat: !InfrastructureShared
-- Name: 65782d7ee819
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
