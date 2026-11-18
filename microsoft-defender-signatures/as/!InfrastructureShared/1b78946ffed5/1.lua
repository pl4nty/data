-- Threat: !InfrastructureShared
-- Name: 1b78946ffed5
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Trojan:Win32/ValleyRAT.GPN!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
