-- Threat: !InfrastructureShared
-- Name: 7878929a70cf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
