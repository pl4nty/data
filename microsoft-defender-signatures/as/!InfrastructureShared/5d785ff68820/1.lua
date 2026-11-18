-- Threat: !InfrastructureShared
-- Name: 5d785ff68820
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
