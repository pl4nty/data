-- Threat: !InfrastructureShared
-- Name: 4f78bd4719aa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
