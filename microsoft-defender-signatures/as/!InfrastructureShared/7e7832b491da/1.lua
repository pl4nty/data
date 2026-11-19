-- Threat: !InfrastructureShared
-- Name: 7e7832b491da
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
