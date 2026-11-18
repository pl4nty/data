-- Threat: !InfrastructureShared
-- Name: 172933b0c6c1
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
if l_0_0.match_offset == 0 then
  if headerpage == nil then
    return mp.CLEAN
  end
  local l_0_1 = mp.readu_u32(headerpage, 1)
  local l_0_2 = mp.readu_u16(headerpage, 5)
  if l_0_1 == 1497451600 and l_0_2 == 2573 then
    return mp.INFECTED
  end
end
return mp.CLEAN
