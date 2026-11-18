-- Threat: !InfrastructureShared
-- Name: 277f79ac7c26
-- Type: 21

function simdmpemb(l_1_0, l_1_1, l_1_2)
  if l_1_0 <= 0 or l_1_2 <= l_1_1 + 24 then
    return mp.CLEAN
  end
  local l_1_3 = mp.readfile(l_1_1, 24)
  if mp.readu_u32(l_1_3, 9) ~= 0 then
    return mp.CLEAN
  end
  local l_1_4 = mp.readu_u32(l_1_3, 5)
  if l_1_4 < 0 or l_1_2 <= l_1_4 then
    return mp.CLEAN
  end
  if 32 <= l_1_4 then
    mp.vfo_add_buffer(mp.readfile(l_1_1 + 24, l_1_4), string.format("[SmrtInstMkrEmb%x]", l_1_1), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
  return simdmpemb(l_1_0 - 1, l_1_1 + l_1_4 + 24, l_1_2)
end

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 16777216 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_regval(pe.REG_EAX)
if l_0_1 <= 0 or 16777216 < l_0_1 then
  return mp.CLEAN
end
mp.readprotection(false)
simdmpemb(10, l_0_1, l_0_0)
return mp.CLEAN
