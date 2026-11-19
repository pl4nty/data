-- Threat: !InfrastructureShared
-- Name: 307839d48f5e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
