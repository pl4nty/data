-- Threat: !InfrastructureShared
-- Name: 8978c6ccd548
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
