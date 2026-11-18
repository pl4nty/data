-- Threat: !InfrastructureShared
-- Name: 138783b3cb572
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
