-- Threat: !InfrastructureShared
-- Name: 195405482bb36
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
