-- Threat: !InfrastructureShared
-- Name: 13178ef320dc5
-- Type: 21
-- Flags: 1

if hstrlog[5].matched or hstrlog[6].matched then
  mp.changedetectionname(805306407)
  return mp.INFECTED
end
return mp.INFECTED
