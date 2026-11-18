-- Threat: !InfrastructureShared
-- Name: 1cd6110b58c64
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
