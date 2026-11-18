-- Threat: !InfrastructureShared
-- Name: 3978f1b4740d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
