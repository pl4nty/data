-- Threat: !InfrastructureShared
-- Name: 6461348bf5d0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
