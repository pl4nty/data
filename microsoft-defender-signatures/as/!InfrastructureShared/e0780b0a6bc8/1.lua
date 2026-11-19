-- Threat: !InfrastructureShared
-- Name: e0780b0a6bc8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
