-- Threat: !InfrastructureShared
-- Name: 2b789043cdc2
-- Type: 21
-- Flags: 1

if pehdr.SizeOfImage > 2097152 then
  mp.set_mpattribute("PUA:Block:Ardamax:Bit")
  return mp.INFECTED
end
return mp.CLEAN
