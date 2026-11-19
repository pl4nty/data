-- Threat: !InfrastructureShared
-- Name: c178d091f18c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
