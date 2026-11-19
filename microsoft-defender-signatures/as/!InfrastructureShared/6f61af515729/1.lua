-- Threat: !InfrastructureShared
-- Name: 6f61af515729
-- Type: 21

if mp.get_mpattribute("Lua:PeCompanyName!igor__pavlov") then
  return mp.INFECTED
end
return mp.CLEAN
