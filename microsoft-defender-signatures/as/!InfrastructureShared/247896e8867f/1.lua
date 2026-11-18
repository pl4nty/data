-- Threat: !InfrastructureShared
-- Name: 247896e8867f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
