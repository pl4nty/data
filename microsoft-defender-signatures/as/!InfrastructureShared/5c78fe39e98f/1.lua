-- Threat: !InfrastructureShared
-- Name: 5c78fe39e98f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
