-- Threat: !InfrastructureShared
-- Name: 26780fda6320
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
