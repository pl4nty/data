-- Threat: !InfrastructureShared
-- Name: 54787398f550
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
