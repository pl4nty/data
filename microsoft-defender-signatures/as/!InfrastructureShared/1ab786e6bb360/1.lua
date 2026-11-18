-- Threat: !InfrastructureShared
-- Name: 1ab786e6bb360
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
