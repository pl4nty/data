-- Threat: !InfrastructureShared
-- Name: b540c16336ae
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
