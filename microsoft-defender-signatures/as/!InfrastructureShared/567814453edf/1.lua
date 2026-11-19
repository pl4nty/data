-- Threat: !InfrastructureShared
-- Name: 567814453edf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
