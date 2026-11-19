-- Threat: !InfrastructureShared
-- Name: 957852354eb0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
