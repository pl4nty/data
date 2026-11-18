-- Threat: !InfrastructureShared
-- Name: 7d78171c34d5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
