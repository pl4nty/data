-- Threat: !InfrastructureShared
-- Name: 2678b09a184b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
