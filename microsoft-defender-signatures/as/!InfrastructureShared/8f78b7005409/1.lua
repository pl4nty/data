-- Threat: !InfrastructureShared
-- Name: 8f78b7005409
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
