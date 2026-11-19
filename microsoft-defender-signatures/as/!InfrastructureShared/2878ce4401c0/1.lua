-- Threat: !InfrastructureShared
-- Name: 2878ce4401c0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
