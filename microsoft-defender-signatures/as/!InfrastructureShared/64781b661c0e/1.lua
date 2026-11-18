-- Threat: !InfrastructureShared
-- Name: 64781b661c0e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
