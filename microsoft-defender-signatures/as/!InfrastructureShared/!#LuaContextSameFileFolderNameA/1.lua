-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextSameFileFolderName.A
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_parent_filehandle()
if not mp.is_handle_nil(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_2 == nil or #l_0_2 < 23 then
  return mp.CLEAN
end
local l_0_3, l_0_4
if string.find(l_0_2, "\\appdata\\roaming\\", 1, true) ~= nil then
  l_0_3 = mp.ContextualExpandEnvironmentVariables("%appdata%")
  l_0_4 = "appdata"
elseif string.find(l_0_2, "\\appdata\\local\\", 1, true) ~= nil then
  l_0_3 = mp.ContextualExpandEnvironmentVariables("%localappdata%")
  l_0_4 = "localappdata"
elseif string.find(l_0_2, "\\appdata\\locallow\\", 1, true) ~= nil then
  l_0_3 = mp.ContextualExpandEnvironmentVariables("%localappdata%Low")
  l_0_4 = "locallowappdata"
else
  return mp.CLEAN
end
if l_0_3 == nil or #l_0_3 < 23 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_5 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
local l_0_6 = {
  exe = true,
  dll = true,
  [".js"] = true,
  jse = true,
  vbs = true,
  vbe = true,
  wsf = true,
  jar = true,
  hta = true,
  lnk = true
}
local l_0_7 = string.sub(l_0_5, -3)
local l_0_8 = true
if l_0_7 == nil or #l_0_7 < 2 or l_0_6[l_0_7] ~= true then
  l_0_8 = false
end
if string.sub(l_0_2, 0, 4) == "\\\\?\\" then
  l_0_2 = string.sub(l_0_2, 5)
end
if #l_0_2 <= #l_0_3 or string.sub(l_0_2, 0, #l_0_3) ~= l_0_3 then
  return mp.CLEAN
end
local l_0_9 = string.match(l_0_2, l_0_3 .. "\\(.+)$")
if l_0_9 == nil or string.len(l_0_9) == 0 or string.find(l_0_9, "\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_10 = string.match(l_0_5, "(.-[^%.]+)")
if l_0_10 == nil or string.len(l_0_10) == 0 then
  return mp.CLEAN
end
if l_0_9 == l_0_10 then
  mp.set_mpattribute("Lua:ContextSameFileFolderName.A!" .. l_0_4)
  if l_0_8 == true then
    mp.set_mpattribute("Lua:ContextSameFileFolderName.A!" .. l_0_4 .. "_" .. l_0_7)
  end
  return mp.INFECTED
end
mp.set_mpattribute("Lua:ContextFileInFirstFolder.A!" .. l_0_4)
if l_0_8 == true then
  mp.set_mpattribute("Lua:ContextFileInFirstFolder.A!" .. l_0_4 .. "_" .. l_0_7)
end
return mp.CLEAN
