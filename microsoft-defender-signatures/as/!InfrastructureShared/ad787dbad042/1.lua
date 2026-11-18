-- Threat: !InfrastructureShared
-- Name: ad787dbad042
-- Type: 21

local l_0_0 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].RVA
if l_0_0 == 0 then
  return mp.INFECTED
end
return mp.CLEAN
