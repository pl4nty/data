-- Threat: !InfrastructureShared
-- Name: 607859c3b197
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
