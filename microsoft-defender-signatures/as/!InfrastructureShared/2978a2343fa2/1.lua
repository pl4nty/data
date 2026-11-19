-- Threat: !InfrastructureShared
-- Name: 2978a2343fa2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
