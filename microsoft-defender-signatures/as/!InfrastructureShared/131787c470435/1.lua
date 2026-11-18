-- Threat: !InfrastructureShared
-- Name: 131787c470435
-- Type: 21

if hstrlog[1].matched and (hstrlog[2].matched or hstrlog[3].matched) and mp.HSTR_WEIGHT >= 8 then
  return mp.INFECTED
end
return mp.CLEAN
