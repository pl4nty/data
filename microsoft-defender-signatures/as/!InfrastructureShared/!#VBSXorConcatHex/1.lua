-- Threat: !InfrastructureShared
-- Name: !#VBSXorConcatHex
-- Type: 13
-- MpAttributes: SCPT:VBSXorConcatHex.1 & SCPT:VBSXorConcatHex.Xor & SCPT:VBSXorConcatHex.Exec

if mp.getfilesize() < 524288 then
  mp.readprotection(false)
  local l_0_0 = mp.readfile(0, mp.getfilesize())
  local l_0_1 = l_0_0:find("=[%s]*\"[%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x]")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = l_0_0:match("[%x]+", l_0_1 + 2)
  local l_0_3
  local l_0_4 = l_0_1 + #l_0_2 + 3
  l_0_1 = l_0_0:find("&[%s]*\"[%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x]", l_0_4)
  while l_0_1 ~= nil do
    l_0_3 = l_0_0:match("[%x]+", l_0_1 + 2)
    l_0_2 = l_0_2 .. l_0_3
    l_0_4 = l_0_1 + #l_0_3 + 3
    l_0_1 = l_0_0:find("&[%s]*\"[%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x]", l_0_4)
  end
  local l_0_5 = string.match(l_0_0, "[Ee][Xx][Ee][Cc][Uu][Tt][Ee][%s]*%([%a]+[%s]*%([%s]*[Cc][Hh][Rr][Ww][%s]*%([%s]*([%d]+)%.?0?[%s]*%)[%s]*,", l_0_4)
  if l_0_5 == nil then
    return mp.CLEAN
  end
  local l_0_6 = tonumber(l_0_5)
  local l_0_7 = {}
  local l_0_8, l_0_9
  for l_0_10 = 0, 255 do
    l_0_8 = string.format("%02x", l_0_10)
    l_0_9 = mp.bitxor(l_0_10, l_0_6)
    l_0_7[l_0_8] = string.format("%c", l_0_9)
  end
  local l_0_11 = string.lower(l_0_2)
  local l_0_12 = string.gsub(l_0_11, "(%x%x)", l_0_7)
  mp.vfo_add_buffer(l_0_12, "[Vbs]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.CLEAN
