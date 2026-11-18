-- Threat: !InfrastructureShared
-- Name: 14b78bd7d431e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
