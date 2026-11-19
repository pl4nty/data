-- Threat: !InfrastructureShared
-- Name: 6a78e5211b4c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
