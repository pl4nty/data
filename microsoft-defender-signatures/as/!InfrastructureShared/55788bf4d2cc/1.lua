-- Threat: !InfrastructureShared
-- Name: 55788bf4d2cc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
