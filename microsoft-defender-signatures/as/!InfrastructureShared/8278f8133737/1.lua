-- Threat: !InfrastructureShared
-- Name: 8278f8133737
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
