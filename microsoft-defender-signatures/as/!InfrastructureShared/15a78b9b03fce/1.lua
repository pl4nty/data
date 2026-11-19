-- Threat: !InfrastructureShared
-- Name: 15a78b9b03fce
-- Type: 21
-- Flags: 1

if hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched then
  if mp.HSTR_WEIGHT >= 110 then
    return mp.INFECTED
  elseif mp.HSTR_WEIGHT >= 60 then
    return mp.LOWFI
  end
end
return mp.CLEAN
