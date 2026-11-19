-- Threat: !InfrastructureShared
-- Name: 2878af7d1dd5
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
