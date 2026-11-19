-- Threat: !InfrastructureShared
-- Name: 2978cbe6086e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
