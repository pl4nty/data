-- Threat: !InfrastructureShared
-- Name: 2b780c103284
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
