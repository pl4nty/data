-- Threat: !InfrastructureShared
-- Name: 11d78ce5e49cb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
