-- Threat: !InfrastructureShared
-- Name: c3788a7d08ed
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
