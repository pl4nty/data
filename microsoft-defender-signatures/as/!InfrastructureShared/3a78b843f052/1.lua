-- Threat: !InfrastructureShared
-- Name: 3a78b843f052
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
