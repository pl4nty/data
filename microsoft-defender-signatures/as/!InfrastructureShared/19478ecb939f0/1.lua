-- Threat: !InfrastructureShared
-- Name: 19478ecb939f0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
