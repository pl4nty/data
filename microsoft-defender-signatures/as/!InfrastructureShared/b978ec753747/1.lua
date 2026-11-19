-- Threat: !InfrastructureShared
-- Name: b978ec753747
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
