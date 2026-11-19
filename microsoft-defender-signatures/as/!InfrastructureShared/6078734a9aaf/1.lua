-- Threat: !InfrastructureShared
-- Name: 6078734a9aaf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
