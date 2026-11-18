-- Threat: !InfrastructureShared
-- Name: 1c29ab786064
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
if l_0_0.match_offset == 0 and l_0_0.is_header then
  local l_0_1 = mp.getfilesize()
  if 64 < l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = mp.readu_u32(headerpage, 1)
  local l_0_3 = mp.readu_u16(headerpage, 5)
  if l_0_2 == 1497451600 and l_0_3 == 2573 then
    return mp.INFECTED
  end
end
return mp.CLEAN
