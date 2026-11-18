-- Threat: !InfrastructureShared
-- Name: 16b7837c7576e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
