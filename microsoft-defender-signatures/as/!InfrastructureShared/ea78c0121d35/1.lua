-- Threat: !InfrastructureShared
-- Name: ea78c0121d35
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched
if mp.HSTR_WEIGHT >= 3 then
  if l_0_0 or hstrlog[3].matched then
    return mp.INFECTED
  end
elseif 2 <= mp.HSTR_WEIGHT then
  return mp.LOWFI
elseif l_0_0 then
  return mp.LOWFI
end
return mp.CLEAN
