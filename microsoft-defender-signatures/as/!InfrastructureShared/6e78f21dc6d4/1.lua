-- Threat: !InfrastructureShared
-- Name: 6e78f21dc6d4
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  if hstrlog[4].matched then
    mp.changedetectionname(805306381)
  end
  return mp.INFECTED
end
return mp.CLEAN
