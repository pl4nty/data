-- Threat: !InfrastructureShared
-- Name: 5b78be868240
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
