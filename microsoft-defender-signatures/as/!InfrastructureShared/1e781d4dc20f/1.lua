-- Threat: !InfrastructureShared
-- Name: 1e781d4dc20f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
