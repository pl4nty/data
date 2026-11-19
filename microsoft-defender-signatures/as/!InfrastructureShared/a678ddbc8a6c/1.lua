-- Threat: !InfrastructureShared
-- Name: a678ddbc8a6c
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
if hstrlog[1].matched or hstrlog[2].matched then
  if mp.HSTR_WEIGHT >= 3 then
    return mp.INFECTED
  end
  if mp.HSTR_WEIGHT >= 2 then
    return mp.LOWFI
  end
end
return mp.CLEAN
