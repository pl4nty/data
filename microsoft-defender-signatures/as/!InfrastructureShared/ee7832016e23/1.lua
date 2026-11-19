-- Threat: !InfrastructureShared
-- Name: ee7832016e23
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
