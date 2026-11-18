-- Threat: !InfrastructureShared
-- Name: 98787ba5bd56
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
