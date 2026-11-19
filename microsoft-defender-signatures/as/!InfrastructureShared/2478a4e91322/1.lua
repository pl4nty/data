-- Threat: !InfrastructureShared
-- Name: 2478a4e91322
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
