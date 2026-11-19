-- Threat: !InfrastructureShared
-- Name: !#Lua:UrlShortCut.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:URLExt & MpIsServerHostOs & SCPT:FileSizeAggr1mb.A

if mp.HEADERPAGE_SZ < 256 then
  return mp.CLEAN
end
local l_0_0 = string.lower(tostring(headerpage))
if l_0_0 == nil then
  return mp.CLEAN
end
for l_0_1 = #l_0_0 - 1, 1, -1 do
  if mp.readu_u16(l_0_0, l_0_1) == 2573 then
    mp.vfo_add_buffer(l_0_0:sub(1, l_0_1), "[InternetShortcut_FILEDATA]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    if 48 < #l_0_0 - l_0_1 then
      mp.set_mpattribute("Lua:InternetShortcutHasAppendedData")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
