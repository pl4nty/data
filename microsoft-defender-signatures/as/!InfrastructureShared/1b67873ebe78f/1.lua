-- Threat: !InfrastructureShared
-- Name: 1b67873ebe78f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
