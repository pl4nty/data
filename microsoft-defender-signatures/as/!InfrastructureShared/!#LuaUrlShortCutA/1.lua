-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaUrlShortCutA\1.luac 

-- params : ...
-- function num : 0
if mp.HEADERPAGE_SZ < 256 then
  return mp.CLEAN
end
local l_0_0 = (string.lower)(tostring(headerpage))
if l_0_0 == nil then
  return mp.CLEAN
end
for l_0_4 = #l_0_0 - 1, 1, -1 do
  if (mp.readu_u16)(l_0_0, l_0_4) == 2573 then
    (mp.vfo_add_buffer)(l_0_0:sub(1, l_0_4), "[InternetShortcut_FILEDATA]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    if #l_0_0 - l_0_4 > 48 then
      (mp.set_mpattribute)("Lua:InternetShortcutHasAppendedData")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN

