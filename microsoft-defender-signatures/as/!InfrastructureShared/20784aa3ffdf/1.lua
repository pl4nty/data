-- Threat: !InfrastructureShared
-- Name: 20784aa3ffdf
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Trojan:Win32/GhostSocks.G5") then
  return mp.INFECTED
end
return mp.CLEAN
