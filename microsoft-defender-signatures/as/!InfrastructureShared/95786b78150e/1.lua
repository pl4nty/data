-- Threat: !InfrastructureShared
-- Name: 95786b78150e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
