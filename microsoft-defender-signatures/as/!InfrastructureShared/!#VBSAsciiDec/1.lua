-- Threat: !InfrastructureShared
-- Name: !#VBSAsciiDec
-- Type: 13
-- MpAttributes: SCPT:VBSAsciiDec

if mp.getfilesize() < 524288 then
  mp.readprotection(false)
  local l_0_0 = mp.readfile(0, mp.getfilesize())
  local l_0_1 = l_0_0:find("=\"", 1, true)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = l_0_0:match("[%d,]+", l_0_1 + 2)
  local l_0_3 = {}
  for l_0_4 = 0, 255 do
    l_0_3[string.format("%d", l_0_4)] = string.format("%c", l_0_4)
  end
  local l_0_5 = string.gsub(l_0_2, "(%d+),", l_0_3)
  mp.vfo_add_buffer(l_0_5, "[Ascii]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.CLEAN
