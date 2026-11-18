-- Threat: !InfrastructureShared
-- Name: 79785c88f34b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
