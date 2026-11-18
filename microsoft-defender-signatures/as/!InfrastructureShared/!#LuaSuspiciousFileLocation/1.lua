-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousFileLocation
-- Type: 9
-- MpAttributes: RPF:TopLevelFile

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilename()
if r0_0 == nil then
  return mp.CLEAN
end
local r0_1 = string.lower(r0_0)
local r0_2 = string.sub(r0_1, -4)
if r0_2 == ".dll" then
  if string.len(r0_1) < 30 then
    return mp.CLEAN
  end
  if r0_1:find("\\appdata\\locallow", 1, true) == nil then
    if string.sub(r0_1, -30) == "\\appdata\\local\\temp\\mdi064.dll" then
      mp.set_mpattribute("Lua:FigyekDroppedFile.A")
    end
  elseif string.match(r0_1, "\\appdata\\locallow\\%l%l%l%l%l%.dll")
    or string.match(r0_1, "\\appdata\\locallow\\%l%l%l%l%l%l%.dll")
    or string.match(r0_1, "\\appdata\\locallow\\%1%l%l%l%l%l%l%.dll") then
    mp.set_mpattribute("Lua:NotodarFilename.A")
  end
elseif r0_2 == ".exe" then
  if string.len(r0_1) < 19 then
    return mp.CLEAN
  end
  if r0_1:find("\\appdata\\roaming\\", 1, true) == nil then
    if r0_1:find("\\appdata\\local", 1, true) == nil then
      if r0_1:find("\\appdata\\", 1, true) == nil then
        if r0_1:find(":\\programdata\\", 1, true) == nil then
          if r0_1:find("\\documents\\", 1, true) ~= nil then
            local r0_3, r0_4 = r0_1:match("(.+\\)([^\\]+)$")
            if string.match(r0_3, "\\users\\.+\\documents\\$") then
              mp.set_mpattribute("Lua:SuspiciousExeFileInUserDocumentsFolder.A")
            end
          end
        else
          local r0_5, r0_6 = r0_1:match("(.+\\)([^\\]+)$")
          if string.sub(r0_5, -14) == ":\\programdata\\" then
            mp.set_mpattribute("Lua:SuspiciousExeFileInProgramData.A")
          elseif string.match(r0_5, ":\\programdata\\%d%d%d%d%d%d\\$")
            or string.sub(r0_5, -24) == ":\\programdata\\microsoft\\" then
            mp.set_mpattribute("Lua:SuspiciousExeFileLocationInProgramData.A")
          end
        end
      else
        local r0_7, r0_8 = r0_1:match("(.+\\)([^\\]+)$")
        if string.sub(r0_7, -9) == "\\appdata\\" then
          mp.set_mpattribute("Lua:SuspiciousExeFileInAppdata.B")
        end
      end
    else
      local r0_9, r0_10 = r0_1:match("(.+\\)([^\\]+)$")
      if string.sub(r0_9, -22) == "\\local\\default folder\\" then
        mp.set_mpattribute("Lua:SuspiciousExeFileLocationInLocalAppdata.A")
      elseif string.sub(r0_9, -15) == "\\appdata\\local\\" then
        mp.set_mpattribute("Lua:SuspiciousExeFileInLocalAppdata.A")
      elseif string.sub(r0_9, -18) == "\\appdata\\locallow\\" then
        mp.set_mpattribute("Lua:SuspiciousExeFileInLocalLowAppdata.A")
      end
    end
  else
    local r0_11, r0_12 = r0_1:match("(.+\\)([^\\]+)$")
    if string.sub(r0_11, -17) == "\\appdata\\roaming\\" then
      mp.set_mpattribute("Lua:SuspiciousExeFileInAppdata.A")
    elseif string.sub(r0_11, -27) == "\\appdata\\roaming\\microsoft\\" then
      mp.set_mpattribute("Lua:SuspiciousExeFileInAppdataMicrosoft.A")
    elseif string.sub(r0_11, -35) == "\\appdata\\roaming\\microsoft\\windows\\" then
      mp.set_mpattribute("Lua:SuspiciousExeFileInAppdataMicrosoftWindows.A")
    elseif string.sub(r0_11, -31) == "\\appdata\\roaming\\windowsupdate\\" then
      mp.set_mpattribute("Lua:SuspiciousExeFileInAppdataWindowsupdate.A")
    elseif string.match(r0_1, "\\appdata\\roaming\\%w%whost\\%w%whost.exe$") then
      mp.set_mpattribute("Lua:SuspiciousHostExeFileInAppdata.A")
    end
  end
end
return mp.CLEAN
