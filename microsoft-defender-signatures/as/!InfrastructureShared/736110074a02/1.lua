-- Threat: !InfrastructureShared
-- Name: 736110074a02
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
