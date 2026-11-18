-- Threat: !InfrastructureShared
-- Name: a978fc393779
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
