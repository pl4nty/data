-- Threat: !InfrastructureShared
-- Name: 382933a593e4
-- Type: 21

if mp.getfilesize() <= 2048 and mp.get_mpattribute("PACKED_WITH:[Eval]") then
  return mp.INFECTED
end
return mp.CLEAN
