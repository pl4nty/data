-- Threat: !InfrastructureShared
-- Name: 44788aa6ebd1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
