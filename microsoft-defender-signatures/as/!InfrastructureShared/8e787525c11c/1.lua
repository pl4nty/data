-- Threat: !InfrastructureShared
-- Name: 8e787525c11c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() == 749056 then
  return mp.INFECTED
end
return mp.CLEAN
