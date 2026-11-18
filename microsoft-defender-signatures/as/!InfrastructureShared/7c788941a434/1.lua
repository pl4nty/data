-- Threat: !InfrastructureShared
-- Name: 7c788941a434
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
