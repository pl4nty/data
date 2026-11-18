-- Threat: !InfrastructureShared
-- Name: e37864b0d625
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
