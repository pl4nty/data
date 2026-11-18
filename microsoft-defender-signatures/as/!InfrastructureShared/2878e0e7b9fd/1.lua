-- Threat: !InfrastructureShared
-- Name: 2878e0e7b9fd
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Trojan:Win32/DllSideLoading.BA002") then
  return mp.INFECTED
end
return mp.CLEAN
