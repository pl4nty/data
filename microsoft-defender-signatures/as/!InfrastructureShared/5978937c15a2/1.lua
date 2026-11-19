-- Threat: !InfrastructureShared
-- Name: 5978937c15a2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
