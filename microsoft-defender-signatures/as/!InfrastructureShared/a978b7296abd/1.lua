-- Threat: !InfrastructureShared
-- Name: a978b7296abd
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT > 2 then
  return mp.INFECTED
end
if hstrlog[1].matched and hstrlog[3].matched then
  local l_0_0 = hstrlog[1].VA
  local l_0_1 = hstrlog[3].VA
  if pe.contains_va(1, l_0_0) ~= true then
    return mp.CLEAN
  end
  if pe.contains_va(1, l_0_1) ~= true then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
