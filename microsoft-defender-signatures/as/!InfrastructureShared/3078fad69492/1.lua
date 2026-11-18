-- Threat: !InfrastructureShared
-- Name: 3078fad69492
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
