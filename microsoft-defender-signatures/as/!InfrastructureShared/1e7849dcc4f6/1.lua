-- Threat: !InfrastructureShared
-- Name: 1e7849dcc4f6
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and mp.get_mpattribute("NID:Trojan:Win64/DllHijack.G5") then
  return mp.INFECTED
end
return mp.CLEAN
