-- Threat: !InfrastructureShared
-- Name: 62781760a72e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
