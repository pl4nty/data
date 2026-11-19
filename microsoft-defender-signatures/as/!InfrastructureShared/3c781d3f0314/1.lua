-- Threat: !InfrastructureShared
-- Name: 3c781d3f0314
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
