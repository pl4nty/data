-- Threat: !InfrastructureShared
-- Name: 10578a6ef3b84
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
