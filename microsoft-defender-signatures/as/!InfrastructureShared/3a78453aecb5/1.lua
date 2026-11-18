-- Threat: !InfrastructureShared
-- Name: 3a78453aecb5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 600000 then
  return mp.INFECTED
end
return mp.CLEAN
