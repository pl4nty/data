-- Threat: !InfrastructureShared
-- Name: !#Lua:GenericNonRTP
-- Type: 10

if pehdr.Machine ~= 332 or peattributes.isappcontainer or peattributes.resource_only_dll or peattributes.no_ep or peattributes.dmg_entrypoint or peattributes.dmg_not_executable_image or peattributes.dmg_truncated then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 256 or 5242880 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 ~= nil and l_0_1 ~= mp.SCANREASON_UNKNOWN then
  return mp.CLEAN
end
if mp.GetResmgrBasePlugin() ~= "Folder" then
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.getfilename())
if l_0_2:find(":\\windows\\winsxs", 1, true) ~= nil then
  return mp.CLEAN
end
if l_0_2:find(":\\windows\\installer", 1, true) ~= nil then
  return mp.CLEAN
end
if l_0_2:find(":\\sccmcontentlib\\filelib", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_3 = mp.gethost()
if l_0_3 ~= mp.HOST_X86 and l_0_3 ~= mp.HOST_X64 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = pcall(mp.get_parent_filehandle)
if l_0_4 then
  l_0_4, _ = pcall(mp.get_filesize_by_handle, l_0_5)
  if l_0_4 then
    return mp.CLEAN
  end
end
local l_0_6 = mp.utf16to8(mp.getwfilename())
local l_0_7 = sysio.GetFileAttributes(l_0_6)
local l_0_8 = "|" .. l_0_6:match("..-[^\\/]-(%.?[^%.\\/:]+):?[^%.\\/:]*$"):lower() .. "|"
local l_0_9 = "|.exe|.bat|.cmd|.pif|.scr|.cpl|.dll|.ocx|.sys|.drv|.data|.metadata_dll|.mptest|.api|.ax|.pmp|.mpp|.x3d|.mp|.pun|.ref|.p3k|.acm|.ime|.deploy"
local l_0_10 = {
  "Lua:GenericNonRtp",
  nil == (l_0_6:find(".", 1, true) and l_0_9:find(l_0_8, 1, true)) and "N" or "_",
  l_0_7 ~= 4294967295 and mp.bitand(l_0_7, 2) ~= 0 and "H" or "_",
  peattributes.genpacked and "P" or "_"
}
mp.set_mpattribute(table.concat(l_0_10, ""))
return mp.CLEAN
