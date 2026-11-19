-- Threat: !InfrastructureShared
-- Name: 1f7f7ab41ab7
-- Type: 21

function simdmpcab(l_1_0, l_1_1)
  if l_1_0 <= 0 or l_1_1 >= mp.getfilesize() then
    return mp.CLEAN
  end
  local l_1_2 = mp.readfile(l_1_1, 32)
  local l_1_3 = mp.readu_u32(l_1_2, 5) - 4
  if l_1_3 <= 0 or l_1_3 >= mp.getfilesize() then
    return mp.CLEAN
  end
  if 32 < l_1_3 then
    local l_1_4 = "MSCF" .. mp.readfile(l_1_1, l_1_3)
    mp.vfo_add_buffer(l_1_4, string.format("[SmrtInstMkrCab%x]", l_1_1), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
  return simdmpcab(l_1_0 - 1, l_1_1 + l_1_3)
end

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 16777216 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_regval(pe.REG_EAX)
if l_0_1 <= 0 then
  return mp.CLEAN
end
mp.readprotection(false)
simdmpcab(5, l_0_1)
return mp.CLEAN
