-- Threat: !InfrastructureShared
-- Name: 3a78711b77b9
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Trojan:Win64/Ulise.SXN!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
