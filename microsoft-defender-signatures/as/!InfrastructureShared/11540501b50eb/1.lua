-- Threat: !InfrastructureShared
-- Name: 11540501b50eb
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
