-- Threat: !InfrastructureShared
-- Name: 927899e8e878
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win32/Tedy.LML!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
