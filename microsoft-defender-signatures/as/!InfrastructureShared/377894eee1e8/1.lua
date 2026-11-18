-- Threat: !InfrastructureShared
-- Name: 377894eee1e8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
