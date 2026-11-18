-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousDropExe.A
-- Type: 9

function is_emotet_filename(l_1_0)
  return string.sub(l_1_0, 4) == "video.exe" or string.sub(l_1_0, 4) == "windows.exe" or string.sub(l_1_0, 4) == "update.exe" or string.sub(l_1_0, 4) == "system.exe" or string.sub(l_1_0, 4) == "sock.exe" or string.sub(l_1_0, 4) == "share.exe" or string.sub(l_1_0, 4) == "setup.exe" or string.sub(l_1_0, 4) == "serial.exe" or string.sub(l_1_0, 4) == "mgr32.exe" or string.sub(l_1_0, 4) == "error.exe" or string.sub(l_1_0, 4) == "edit32.exe" or string.sub(l_1_0, 4) == "crypt.exe" or string.sub(l_1_0, 4) == "config.exe" or string.sub(l_1_0, 4) == "common.exe" or string.sub(l_1_0, 4) == "cap32.exe" or string.sub(l_1_0, 4) == "boot.exe" or string.sub(l_1_0, 4) == "bios.exe" or string.sub(l_1_0, 4) == "audio.exe" or string.sub(l_1_0, 4) == "api32.exe"
end

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1:sub(-4) == ".exe" then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if l_0_2:sub(-42) == "\\local settings\\application data\\microsoft" or l_0_2:sub(-26) == "\\appdata\\roaming\\microsoft" then
      local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_ATTRIBUTES)
      if mp.bitand(l_0_3, 7) ~= 0 then
        if is_emotet_filename(l_0_1) then
          mp.set_mpattribute("Lua:EmotetFilenameAppdata.A")
        else
          mp.set_mpattribute("Lua:SuspiciousDropExe.A")
        end
      end
    end
  end
end
return mp.CLEAN
