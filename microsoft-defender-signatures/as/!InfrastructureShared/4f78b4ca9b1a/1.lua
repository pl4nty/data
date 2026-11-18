-- Threat: !InfrastructureShared
-- Name: 4f78b4ca9b1a
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
