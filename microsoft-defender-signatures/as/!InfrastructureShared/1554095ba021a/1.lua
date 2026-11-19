-- Threat: !InfrastructureShared
-- Name: 1554095ba021a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
