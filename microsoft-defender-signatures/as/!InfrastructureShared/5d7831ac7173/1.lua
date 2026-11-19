-- Threat: !InfrastructureShared
-- Name: 5d7831ac7173
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
