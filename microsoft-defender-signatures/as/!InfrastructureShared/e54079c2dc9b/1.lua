-- Threat: !InfrastructureShared
-- Name: e54079c2dc9b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
