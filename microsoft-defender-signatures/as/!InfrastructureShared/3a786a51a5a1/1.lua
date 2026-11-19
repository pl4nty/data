-- Threat: !InfrastructureShared
-- Name: 3a786a51a5a1
-- Type: 21
-- Flags: 1

if pesecs[2].Name == ".text1" and pesecs[5].VirtualSize > 65536 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
