-- Threat: !InfrastructureShared
-- Name: 247810023443
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
