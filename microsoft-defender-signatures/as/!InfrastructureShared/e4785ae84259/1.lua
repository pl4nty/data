-- Threat: !InfrastructureShared
-- Name: e4785ae84259
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
