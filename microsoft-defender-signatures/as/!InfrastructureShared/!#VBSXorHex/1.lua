-- Threat: !InfrastructureShared
-- Name: !#VBSXorHex
-- Type: 13
-- MpAttributes: SCPT:VBSXorHex

if mp.getfilesize() < 524288 then
  mp.readprotection(false)
  local l_0_0 = mp.readfile(0, mp.getfilesize())
  local l_0_1 = l_0_0:find("=\"", 1, true)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = l_0_0:match("[%x]+", l_0_1 + 2)
  local l_0_3 = string.match(l_0_0, "[Xx][Oo][Rr][%s]+([%d]+)", l_0_1 + 2 + #l_0_2)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = tonumber(l_0_3)
  local l_0_5 = {}
  local l_0_6, l_0_7
  for l_0_8 = 0, 255 do
    l_0_6 = string.format("%02X", l_0_8)
    l_0_7 = mp.bitxor(l_0_8, l_0_4)
    l_0_5[l_0_6] = string.format("%c", l_0_7)
  end
  local l_0_9 = string.gsub(l_0_2, "(%x%x)", l_0_5)
  mp.vfo_add_buffer(l_0_9, "[Xor]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.CLEAN
