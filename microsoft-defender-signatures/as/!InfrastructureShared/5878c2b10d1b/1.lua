-- Threat: !InfrastructureShared
-- Name: 5878c2b10d1b
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and mp.get_mpattribute("NID:Win64/Bumblebee.PB!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
