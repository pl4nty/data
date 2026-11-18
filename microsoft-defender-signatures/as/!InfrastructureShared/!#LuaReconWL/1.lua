-- Threat: !InfrastructureShared
-- Name: !#Lua:ReconWL
-- Type: 11

if mp.get_mpattributesubstring(":ReconWL:") then
  return mp.INFECTED
end
return mp.CLEAN
