-- Threat: !InfrastructureShared
-- Name: d540d58c1f8c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
