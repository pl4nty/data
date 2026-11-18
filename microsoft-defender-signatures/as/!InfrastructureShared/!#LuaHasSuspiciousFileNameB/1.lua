-- Threat: !InfrastructureShared
-- Name: !#Lua:HasSuspiciousFileName.B
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
local l_0_2 = mp.gethost()
if l_0_2 ~= mp.HOST_X86 and l_0_2 ~= mp.HOST_X64 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(mp.get_parent_filehandle)
if l_0_3 then
  l_0_3, _ = pcall(mp.get_filesize_by_handle, l_0_4)
  if l_0_3 then
    return mp.CLEAN
  end
end
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
local l_0_6, l_0_7 = l_0_5:match("^([0-9A-Fa-f]+)%.(...)")
if l_0_6 == nil or string.len(l_0_6) < 32 or string.find(l_0_6, "[0-9]", 1) == nil or string.find(l_0_6, "[A-Fa-f]", 1) == nil then
  return mp.CLEAN
end
return mp.INFECTED
