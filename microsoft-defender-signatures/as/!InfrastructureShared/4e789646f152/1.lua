-- Threat: !InfrastructureShared
-- Name: 4e789646f152
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
