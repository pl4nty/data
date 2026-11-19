-- Threat: !InfrastructureShared
-- Name: 2778d02f337d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
