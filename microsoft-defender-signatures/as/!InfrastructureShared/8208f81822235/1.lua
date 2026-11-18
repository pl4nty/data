-- Threat: !InfrastructureShared
-- Name: 8208f81822235
-- Type: 21

if hstrlog[1].matched or hstrlog[2].matched then
  if hstrlog[1].matched and hstrlog[2].matched then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
