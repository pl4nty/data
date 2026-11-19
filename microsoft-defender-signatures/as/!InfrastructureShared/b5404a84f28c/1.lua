-- Threat: !InfrastructureShared
-- Name: b5404a84f28c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
