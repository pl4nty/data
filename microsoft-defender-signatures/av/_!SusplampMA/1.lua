-- Threat: \xac!Susplamp.MA
-- Type: 13
-- Includes: LuaFuncHelper, BMLuaLib
-- MpAttributes: (RPF:TopLevelFile) & (BM_UNKNOWN_FILE) & (LUA:FileSizeGT20M.A) & !Lua:DATExt & !Lua:SDFExt & !Lua:MYOXExt & !Lua:DBExt

local l_0_0, l_0_1 = pcall(mp.readu_u32, headerpage, 1)
if not l_0_0 or isnull(l_0_1) then
  return mp.CLEAN
end
if 536870912 < l_0_1 and l_0_1 < 553648128 then
  mp.readprotection(false)
  local l_0_2 = mp.readfile(0, 4)
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  l_0_2 = tostring(l_0_2)
  local l_0_3 = string.lower(l_0_2)
  mp.readprotection(true)
  if string.find(l_0_3, "rem ", 1, true) ~= nil then
    local l_0_4 = "SusLampz"
    local l_0_5 = 3600
    local l_0_6 = 15
    AppendToRollingQueue(l_0_4, "lampz", 1, l_0_5, l_0_6)
    return mp.INFECTED
  end
end
return mp.CLEAN
