-- Threat: !InfrastructureShared
-- Name: !#Lua:TopLevelFileInformation.A
-- Type: 12

local l_0_0 = mp.get_parent_filehandle()
if mp.is_handle_nil(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 8 then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_1, "->", 1, true)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.sub(l_0_1, 0, l_0_2 - 1)
if l_0_3 == nil or #l_0_3 <= 2 then
  return mp.CLEAN
end
if string.find(l_0_3, ".", 1, true) == nil then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_3, "([^\\%.]+)$")
if l_0_4 == nil or #l_0_4 == 0 or 5 < #l_0_4 then
  return mp.CLEAN
end
local l_0_5 = "Lua:TopLevelFileExt.A!"
mp.set_mpattribute(l_0_5 .. l_0_4)
local l_0_6 = {
  exe = true,
  dll = true,
  js = true,
  jse = true,
  vbs = true,
  vbe = true,
  wsf = true,
  jar = true,
  hta = true,
  lnk = true,
  bat = true,
  cmd = true
}
if l_0_6[l_0_4] then
  local l_0_7 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_7 == nil or #l_0_7 <= 3 then
    return mp.CLEAN
  end
  l_0_7 = l_0_7 .. "\\"
  if string.match(l_0_7, "\\appdata\\") then
    mp.set_mpattribute("Lua:TopLevelFile.A!FileInsideAppData")
    if string.match(l_0_7, "\\appdata\\local\\") then
      mp.set_mpattribute("Lua:TopLevelFile.A!FileInAppDataLocal")
      if string.match(l_0_7, "\\appdata\\local\\temp\\") then
        mp.set_mpattribute("Lua:TopLevelFile.A!FileInAppDataLocalTemp")
      end
    elseif string.match(l_0_7, "\\appdata\\roaming\\") then
      mp.set_mpattribute("Lua:TopLevelFile.A!FileInAppDataRoaming")
      if string.match(l_0_7, "\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup\\") then
        mp.set_mpattribute("Lua:TopLevelFile.A!FileInStartup")
      end
    end
  elseif string.match(l_0_7, "\\program files\\") then
    mp.set_mpattribute("Lua:TopLevelFile.A!FileInProgramFiles")
  elseif string.match(l_0_7, "\\program files (x86)\\") then
    mp.set_mpattribute("Lua:TopLevelFile.A!FileInProgramFilesX86")
  elseif string.match(l_0_7, "\\programdata\\") then
    mp.set_mpattribute("Lua:TopLevelFile.A!FileInProgramData")
  elseif string.match(l_0_7, "\\windows\\system32\\") then
    mp.set_mpattribute("Lua:TopLevelFile.A!FileInSystem32")
  elseif string.match(l_0_7, "c:\\windows\\") then
    mp.set_mpattribute("Lua:TopLevelFile.A!Lua:FileInWindows")
  elseif string.match(l_0_7, "\\users\\[^\\]+\\") then
    mp.set_mpattribute("Lua:TopLevelFile.A!FileInUserProfile")
    if string.match(l_0_7, "\\users\\[^\\]+\\documents\\") then
      mp.set_mpattribute("Lua:TopLevelFile.A!FileInUserDocument")
    elseif string.match(l_0_7, "\\users\\[^\\]+\\downloads\\") then
      mp.set_mpattribute("Lua:TopLevelFile.A!FileInUserDownloads")
    elseif string.match(l_0_7, "\\users\\[^\\]+\\desktop\\") then
      mp.set_mpattribute("Lua:TopLevelFile.A!FileInUserDesktop")
    end
  end
end
return mp.CLEAN
