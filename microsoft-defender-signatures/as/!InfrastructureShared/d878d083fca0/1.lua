-- Threat: !InfrastructureShared
-- Name: d878d083fca0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
