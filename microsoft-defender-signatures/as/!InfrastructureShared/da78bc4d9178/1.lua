-- Threat: !InfrastructureShared
-- Name: da78bc4d9178
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
