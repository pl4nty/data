-- Threat: !InfrastructureShared
-- Name: ec78a41ae2c2
-- Type: 21

if peattributes.isexe and peattributes.ismsil and mp.getfilesize() > 20000000 then
  return mp.INFECTED
end
return mp.CLEAN
