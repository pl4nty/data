-- Threat: !InfrastructureShared
-- Name: f97808020434
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
