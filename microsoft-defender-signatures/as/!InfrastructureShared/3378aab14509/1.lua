-- Threat: !InfrastructureShared
-- Name: 3378aab14509
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
