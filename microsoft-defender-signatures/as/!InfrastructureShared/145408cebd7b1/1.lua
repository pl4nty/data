-- Threat: !InfrastructureShared
-- Name: 145408cebd7b1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
