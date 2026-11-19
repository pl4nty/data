-- Threat: !InfrastructureShared
-- Name: f77836b6835e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
