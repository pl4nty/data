-- Threat: !InfrastructureShared
-- Name: 52782c8d9abe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
