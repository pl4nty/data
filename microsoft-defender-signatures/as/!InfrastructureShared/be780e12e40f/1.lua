-- Threat: !InfrastructureShared
-- Name: be780e12e40f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
