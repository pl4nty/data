-- Threat: !InfrastructureShared
-- Name: 1ee78fe76b2f1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
