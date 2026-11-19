-- Threat: !InfrastructureShared
-- Name: c47884a7791b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
