-- Threat: !InfrastructureShared
-- Name: 3378a3960bde
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
