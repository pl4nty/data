-- Threat: !InfrastructureShared
-- Name: 35780d625476
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
