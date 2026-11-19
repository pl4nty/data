-- Threat: !InfrastructureShared
-- Name: 6c783d607454
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
