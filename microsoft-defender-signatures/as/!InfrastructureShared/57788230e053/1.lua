-- Threat: !InfrastructureShared
-- Name: 57788230e053
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
