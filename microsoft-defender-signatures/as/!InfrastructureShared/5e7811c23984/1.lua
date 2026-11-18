-- Threat: !InfrastructureShared
-- Name: 5e7811c23984
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
