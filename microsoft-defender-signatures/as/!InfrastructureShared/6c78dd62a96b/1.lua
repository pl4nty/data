-- Threat: !InfrastructureShared
-- Name: 6c78dd62a96b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
