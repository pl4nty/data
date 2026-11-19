-- Threat: !InfrastructureShared
-- Name: 8c7897ea2537
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
