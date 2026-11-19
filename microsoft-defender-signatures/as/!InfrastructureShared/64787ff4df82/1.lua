-- Threat: !InfrastructureShared
-- Name: 64787ff4df82
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Win32/Emotet.PBB!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
