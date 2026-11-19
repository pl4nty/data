-- Threat: !InfrastructureShared
-- Name: 29540d636e906
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
