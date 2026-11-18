-- Threat: !InfrastructureShared
-- Name: 5e7855125fcb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
