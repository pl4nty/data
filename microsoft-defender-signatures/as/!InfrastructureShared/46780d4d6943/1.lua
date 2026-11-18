-- Threat: !InfrastructureShared
-- Name: 46780d4d6943
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched then
  return mp.INFECTED
end
return mp.CLEAN
