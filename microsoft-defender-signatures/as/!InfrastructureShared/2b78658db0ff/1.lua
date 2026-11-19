-- Threat: !InfrastructureShared
-- Name: 2b78658db0ff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
