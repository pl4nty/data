-- Threat: !InfrastructureShared
-- Name: 8e78d6753880
-- Type: 21

if peattributes.ismsil then
  mp.set_mpattribute("PUA:Block:WizzRemote:Bit")
  return mp.INFECTED
end
return mp.CLEAN
