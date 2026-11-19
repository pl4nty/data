-- Threat: !InfrastructureShared
-- Name: 17878e4d91d0a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
