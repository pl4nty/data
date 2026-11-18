-- Threat: !InfrastructureShared
-- Name: ef78715837b1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
