-- Threat: !InfrastructureShared
-- Name: 4778483e59bc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
