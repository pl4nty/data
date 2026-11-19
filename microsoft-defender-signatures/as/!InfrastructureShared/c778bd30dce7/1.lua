-- Threat: !InfrastructureShared
-- Name: c778bd30dce7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
