-- Threat: !InfrastructureShared
-- Name: a3787755daa7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
