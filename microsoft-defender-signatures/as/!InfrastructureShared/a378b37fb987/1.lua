-- Threat: !InfrastructureShared
-- Name: a378b37fb987
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
