-- Threat: !InfrastructureShared
-- Name: !#Lua:Backdoor:Win32/Fynloski!CreateKeylog
-- Type: 13

local l_0_0
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_1 == mp.SCANREASON_ONOPEN or l_0_1 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_0 == nil then
    return mp.CLEAN
  end
  if l_0_0:sub(-3):lower() ~= ".dc" then
    return mp.CLEAN
  end
  local l_0_2
  l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if (string.find(l_0_2, "\\application data\\dclogs", 1, true) or string.find(l_0_2, "\\appdata\\roaming\\dclogs", 1, true)) and string.find(l_0_0, "20%d%d%-[01][0-9]%-[0-3][0-9]%-%d%d?%.dc", 1, false) then
    local l_0_3, l_0_4
    l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    l_0_4 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
    if l_0_3 == nil or l_0_4 == nil then
      return mp.CLEAN
    end
    if string.sub(l_0_3, -4) == ".exe" and (string.find(l_0_4, "\\desktop\\.+") or string.find(l_0_4, "\\.-documents\\.+") or string.find(l_0_4, "\\start menu\\.+") or string.find(l_0_4, "\\programdata", 1, true) or string.find(l_0_4, "\\appdata\\local", 1, true) or string.find(l_0_4, "\\appdata\\roaming", 1, true) or string.find(l_0_4, "\\local settings\\temp", 1, true) or string.find(l_0_4, "\\windows\\system32\\.+") or string.find(l_0_4, "\\administrator\\application data", 1, true) or string.find(l_0_4, "\\local settings\\application data", 1, true)) then
      mp.ReportLowfi(MpCommon.PathToWin32Path(l_0_4) .. "\\" .. l_0_3, 949894675)
    end
  end
end
return mp.CLEAN
