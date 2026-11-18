-- Threat: !InfrastructureShared
-- Name: 6a787d3ac76a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
