-- Threat: !InfrastructureShared
-- Name: 7178219b8c12
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
