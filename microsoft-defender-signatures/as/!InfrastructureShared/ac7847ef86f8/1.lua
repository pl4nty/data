-- Threat: !InfrastructureShared
-- Name: ac7847ef86f8
-- Type: 21

if peattributes.ismsil then
  mp.set_mpattribute("PUA:Block:WizzRemote:Bit")
  return mp.INFECTED
end
return mp.CLEAN
