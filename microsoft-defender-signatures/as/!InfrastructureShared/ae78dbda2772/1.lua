-- Threat: !InfrastructureShared
-- Name: ae78dbda2772
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
