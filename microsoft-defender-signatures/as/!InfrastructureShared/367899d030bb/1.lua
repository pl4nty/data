-- Threat: !InfrastructureShared
-- Name: 367899d030bb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
