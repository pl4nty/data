-- Threat: !InfrastructureShared
-- Name: 377886f77fe9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
