-- Threat: !InfrastructureShared
-- Name: e4785991a928
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
