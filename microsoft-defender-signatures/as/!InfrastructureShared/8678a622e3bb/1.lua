-- Threat: !InfrastructureShared
-- Name: 8678a622e3bb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
