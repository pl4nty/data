-- Threat: !InfrastructureShared
-- Name: 3678b8a8acc5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
