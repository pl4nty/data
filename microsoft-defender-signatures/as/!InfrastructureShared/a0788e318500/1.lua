-- Threat: !InfrastructureShared
-- Name: a0788e318500
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
