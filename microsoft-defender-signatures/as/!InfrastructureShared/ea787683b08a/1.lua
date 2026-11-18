-- Threat: !InfrastructureShared
-- Name: ea787683b08a
-- Type: 21

if hstrlog[7].matched and hstrlog[8].matched then
  mp.changedetectionname(805306748)
  return mp.INFECTED
end
return mp.INFECTED
