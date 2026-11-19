-- Threat: !InfrastructureShared
-- Name: 757859c8da3d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
