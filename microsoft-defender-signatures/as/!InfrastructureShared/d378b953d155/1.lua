-- Threat: !InfrastructureShared
-- Name: d378b953d155
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
