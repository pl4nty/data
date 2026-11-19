-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualKasidet
-- Type: 9

if not peattributes.isexe then
  return mp.CLEAN
end
local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.LegalCopyright == nil then
  return mp.CLEAN
end
if string.find(l_0_0.LegalCopyright, "Microsoft Corporation", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 == mp.SCANREASON_ONOPEN then
  local l_0_2 = {
    ["explorer.exe"] = "",
    ["hh.exe"] = "",
    ["isuninst.exe"] = "",
    ["notepad.exe"] = "",
    ["regedit.exe"] = "",
    ["slrundll.exe"] = "",
    ["taskman.exe"] = "",
    ["twunk_16.exe"] = "",
    ["twunk_32.exe"] = "",
    ["winhelp.exe"] = "",
    ["winhlp32.exe"] = "",
    ["bfsvc.exe"] = "",
    ["fveupdate.exe"] = "",
    ["helppane.exe"] = "",
    ["write.exe"] = "",
    ["splwow64.exe"] = ""
  }
  local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = string.lower(l_0_3)
  if l_0_2[l_0_4] then
    local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
    if l_0_5 == nil then
      return mp.CLEAN
    end
    local l_0_6 = string.lower(l_0_5)
    if (l_0_6:find("\\application data\\[^\\]+$", 1, false) or l_0_6:find("\\appdata\\roaming\\[^\\]+$", 1, false)) and not l_0_6:find("microsoft", 1, true) and not l_0_6:find("windows", 1, true) and not l_0_6:find("installer", 1, true) and not l_0_6:find("citrix", 1, true) then
      local l_0_7 = MpCommon.PathToWin32Path(l_0_5) .. "\\" .. l_0_3
      mp.ReportLowfi(l_0_7, 335137860)
    end
  end
end
return mp.CLEAN
