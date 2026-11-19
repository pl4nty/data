-- Threat: !InfrastructureShared
-- Name: 71783908f856
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
