-- Threat: !InfrastructureShared
-- Name: ba616ba49c38
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
