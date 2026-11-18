-- Threat: !InfrastructureShared
-- Name: b978faa4b4a3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
