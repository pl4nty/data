-- Threat: !InfrastructureShared
-- Name: 1954052c168ad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
