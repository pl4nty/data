-- Threat: !InfrastructureShared
-- Name: 5e78bc795f4c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
