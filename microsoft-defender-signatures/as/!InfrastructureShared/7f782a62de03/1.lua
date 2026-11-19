-- Threat: !InfrastructureShared
-- Name: 7f782a62de03
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
