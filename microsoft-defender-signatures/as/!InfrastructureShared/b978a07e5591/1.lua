-- Threat: !InfrastructureShared
-- Name: b978a07e5591
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
