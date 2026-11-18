-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:ContextualOfficeCreateRunnableContent.A!asrx
-- Type: 13
-- Includes: HipsLuaInfra

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
if GetCtxOfficeProc() ~= "productivity2" then
  return mp.CLEAN
end
local l_0_0 = {
  [".bat"] = true,
  [".cmd"] = true,
  [".com"] = true,
  [".dll"] = true,
  [".exe"] = true,
  [".hta"] = true,
  [".jar"] = true,
  [".js"] = true,
  [".jse"] = true,
  [".lnk"] = true,
  [".ocx"] = true,
  [".pif"] = true,
  [".ps1"] = true,
  [".psc1"] = true,
  [".scr"] = true,
  [".sys"] = true,
  [".vbe"] = true,
  [".vbs"] = true,
  [".wsc"] = true,
  [".wsf"] = true,
  [".wsh"] = true
}
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
l_0_1 = (l_0_1 == nil and "" or l_0_1):lower()
local l_0_2 = l_0_1:sub(-5):match("(%.%w+)$")
l_0_2 = l_0_2 == nil and "" or l_0_2
if l_0_0[l_0_2] ~= true then
  local l_0_3 = mp.getfilename()
  local l_0_4 = MpCommon.GetPersistContext(l_0_3)
  if l_0_4 then
    table.insert(l_0_4, "contextualofficecreaterunnablecontent")
  else
    l_0_4 = {
      "contextualofficecreaterunnablecontent"
    }
  end
  MpCommon.SetPersistContext(l_0_3, l_0_4, 0)
  mp.set_mpattribute("MpDisableCaching")
  return mp.CLEAN
end
local l_0_5 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
l_0_5 = (l_0_5 == nil and "" or l_0_5):lower()
local l_0_6 = mp.ContextualExpandEnvironmentVariables("%appdata%")
l_0_6 = (l_0_6 == nil and "" or l_0_6):lower()
local l_0_7 = mp.ContextualExpandEnvironmentVariables("%localappdata%")
l_0_7 = (l_0_7 == nil and "" or l_0_7):lower()
local l_0_8 = MpCommon.ExpandEnvironmentVariables("%systemdrive%")
l_0_8 = (l_0_8 == nil and "" or l_0_8):lower()
local l_0_9 = MpCommon.ExpandEnvironmentVariables("%systemroot%")
l_0_9 = (l_0_9 == nil and "" or l_0_9):lower()
if l_0_2 == ".lnk" then
  if l_0_5:find(l_0_6 .. "\\microsoft\\office\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5:find(l_0_6 .. "\\microsoft\\excel\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5:find(l_0_6 .. "\\microsoft\\onenote\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5:find(l_0_6 .. "\\microsoft\\outlook\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5:find(l_0_6 .. "\\microsoft\\powerpoint\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5:find(l_0_6 .. "\\microsoft\\word\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5:find(l_0_6 .. "\\microsoft\\internet explorer\\quick launch", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5 == l_0_6 .. "\\microsoft\\windows\\start menu\\programs\\startup" and l_0_1 == "send to onenote.lnk" then
    return mp.CLEAN
  end
  if l_0_5:find(l_0_7 .. "\\invincea\\enterprise\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5:find(l_0_8 .. "\\appsensevirtual\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5:find(l_0_9 .. "\\syswow64\\config\\systemprofile\\appdata\\roaming\\microsoft\\office\\", 1, true) ~= nil then
    return mp.CLEAN
  end
elseif l_0_2 == ".dll" then
  if l_0_5:find(l_0_7 .. "\\assembly\\tmp\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5 == l_0_6 .. "\\microsoft\\msoidentitycrl\\production" then
    return mp.CLEAN
  end
elseif l_0_2 == ".js" then
  if l_0_5:find(l_0_7 .. "\\microsoft\\windows\\inetcache\\ie\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_5:find(l_0_7 .. "\\microsoft\\windows\\temporary internet files\\content.ie5\\", 1, true) ~= nil then
    return mp.CLEAN
  end
elseif l_0_2 == ".com" and l_0_5 == l_0_7 .. "\\microsoft\\forms" then
  return mp.CLEAN
end
return mp.INFECTED
