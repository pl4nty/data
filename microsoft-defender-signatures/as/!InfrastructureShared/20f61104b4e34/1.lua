-- Threat: !InfrastructureShared
-- Name: 20f61104b4e34
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
