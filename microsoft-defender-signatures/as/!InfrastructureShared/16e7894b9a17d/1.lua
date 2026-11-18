-- Threat: !InfrastructureShared
-- Name: 16e7894b9a17d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
