-- Threat: !InfrastructureShared
-- Name: c4783c84d19e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
