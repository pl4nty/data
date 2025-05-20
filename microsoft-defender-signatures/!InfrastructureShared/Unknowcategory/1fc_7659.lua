-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\1fc_7659.luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb") then
  return false
end
local l_0_0 = (ImageConfig.GetImagePath)()
if l_0_0 == nil or l_0_0 == "" then
  return false
end
local l_0_1 = (MpCommon.PathToWin32Path)(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return false
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (MpCommon.ExpandEnvironmentVariables)("%systemroot%")
if l_0_2 == nil or l_0_2 == "" then
  return false
end
l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
if l_0_2 == nil or l_0_2 == "" then
  return false
end
l_0_2 = (string.lower)(l_0_2)
if (string.find)(l_0_1, l_0_2, 1, true) ~= nil then
  return false
end
if (string.find)(l_0_1, ":\\$winreagent\\", 1, true) ~= nil then
  return false
end
if (string.find)(l_0_1, ":\\mount[^\\]*\\windows\\winsxs\\temp\\pendingrenames\\") ~= nil then
  return false
end
if (string.sub)(l_0_1, 2, 12) == ":\\$windows." then
  return false
end
if (string.find)(l_0_1, ":\\windows.old\\", 1, true) ~= nil then
  return false
end
if (string.find)(l_0_1, ":\\$sysreset\\", 1, true) ~= nil then
  return false
end
if (string.find)(l_0_1, ":\\winpe\\windows\\", 1, true) ~= nil then
  return false
end
local l_0_3 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%programfiles%"))
if l_0_3 ~= nil and (string.find)(l_0_1, l_0_3, 1, true) ~= nil then
  if (string.find)(l_0_1, ":\\program files\\windowsapps\\", 1, true) ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files\\git\\", 1, true) ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\java\\jre[^\\]*\\bin\\") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\java\\jdk[^\\]*\\bin\\") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\java\\jre[^\\]*\\bin\\") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files\\sharp\\file-copy\\robocopy.exe", 1, true) ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files\\wsl\\wsl.exe", 1, true) ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft onedrive\\standaloneupdater\\onedrivesetup.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft onedrive\\[%d%.]+\\onedrivesetup.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft onedrive\\update\\onedrivesetup.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft office\\root\\client\\appvdllsurrogate%d*%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft office\\updates\\download\\packagefiles\\[^\\]+\\root\\client\\appvdllsurrogate%d*%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\common files\\microsoft shared\\") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\") ~= nil then
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return false
    end
    if (string.find)(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return false
    end
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\wsl\\wslg.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\windows kits\\%d+\\app certification kit\\aitstatic.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\program files[^\\]*\\sophos\\endpoint defense\\sophosna.exe") ~= nil then
    return false
  end
else
  if (string.find)(l_0_1, "\\appdata\\local\\microsoft\\onedrive\\standaloneupdater\\onedrivesetup.*%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, "\\appdata\\local\\microsoft\\onedrive\\update\\onedrivesetup.*%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, "\\appdata\\local\\microsoft\\onedrive\\[%d%.]+\\onedrivesetup.*%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\programdata\\microsoft\\grouppolicy\\users\\[^\\]+\\datastore\\0\\sysvol\\fcc%.intfcc%.local\\policies\\[^\\]+\\user\\[^\\]+\\logon\\bginfo%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\programdata\\docker\\windowsfilter\\", 1, true) ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\programdata\\dell\\saremediation\\systemrepair\\snapshots\\", 1, true) ~= nil then
    return false
  end
  if (string.find)(l_0_1, ":\\programdata\\dell\\saremediation\\tempdrivers\\dell", 1, true) ~= nil then
    return false
  end
end
local l_0_4 = (string.match)(l_0_1, "\\([^\\]+)$")
if l_0_4 == nil or l_0_4 == "" then
  return false
end
l_0_4 = (string.lower)(l_0_4)
if l_0_4 == "mpsigstub.exe" then
  if (string.find)(l_0_1, "[a-z]:\\{00000000%-0000%-0000%-0000%-000000000000}\\svroot\\windows\\temp\\[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$") ~= nil then
    return false
  end
  if (string.find)(l_0_1, "[a-z]:\\program files[^\\]+\\tanium\\tanium client\\data\\temp\\[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$") ~= nil then
    return false
  end
  if (string.find)(l_0_1, "[a-z]:\\users\\.+\\appdata\\local\\temp\\[%d\\]*[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$") ~= nil then
    return false
  end
  if (string.find)(l_0_1, "[a-z]:\\programdata\\microsoft\\windows defender\\platform\\[^\\]+\\mpsigstub%.exe$") ~= nil then
    return false
  end
end
local l_0_5 = (versioning.GetOrgID)()
if l_0_5 ~= nil and l_0_5 ~= "" then
  l_0_5 = (string.lower)(l_0_5)
end
local l_0_6 = false
if (string.match)(l_0_4, "(%.[^%.]+)$") == ".exe" then
  if (sysio.IsFileExists)(l_0_2 .. "\\system32\\" .. l_0_4) then
    l_0_6 = true
  end
  if not l_0_6 and (sysio.IsFileExists)(l_0_2 .. "\\syswow64\\" .. l_0_4) then
    l_0_6 = true
  end
end
if not l_0_6 then
  local l_0_7 = (MpCommon.GetOriginalFileName)(l_0_0)
  if l_0_7 ~= nil and l_0_7 ~= "" then
    local l_0_8 = nil
    l_0_8 = (string.match)(l_0_7, "%.([^%.]+)$")
    if l_0_8 == nil then
      l_0_7 = l_0_7 .. ".exe"
      l_0_8 = "exe"
    end
    if l_0_5 == "d7c7c745-195f-4223-9c7a-99fb420fd000" and (MpCommon.IsSampled)(65000, false, true, true) == true then
      l_0_8 = (string.lower)(l_0_8)
    end
    if l_0_8 == "exe" then
      if (sysio.IsFileExists)(l_0_2 .. "\\system32\\" .. l_0_7) then
        l_0_6 = true
      end
      if not l_0_6 and (sysio.IsFileExists)(l_0_2 .. "\\syswow64\\" .. l_0_7) then
        l_0_6 = true
      end
    end
  end
end
do
  if not l_0_6 then
    local l_0_9 = (sysio.GetPEVersionInfo)(l_0_1)
    if l_0_9 == nil then
      return false
    end
    if l_0_9.OriginalFilename == nil then
      return false
    end
    local l_0_10 = ((string.lower)(l_0_9.OriginalFilename))
    local l_0_11 = nil
    l_0_11 = (string.match)(l_0_10, "%.([^%.]+)$")
    if l_0_11 == nil then
      l_0_10 = l_0_10 .. ".exe"
    else
      if l_0_11 ~= "exe" then
        return false
      end
    end
    do
      do
        if l_0_5 == "d7c7c745-195f-4223-9c7a-99fb420fd000" and (MpCommon.IsSampled)(65000, false, true, true) == true and (string.find)(l_0_10, "onedrivesetup.*%.exe") ~= nil then
          local l_0_12 = (ImageConfig.GetPpid)()
          if l_0_12 ~= nil and l_0_12 ~= "" and (MpCommon.IsFriendlyProcess)(l_0_12) == true then
            return false
          end
        end
        if (sysio.IsFileExists)(l_0_2 .. "\\system32\\" .. l_0_10) then
          l_0_6 = true
        end
        if not l_0_6 and (sysio.IsFileExists)(l_0_2 .. "\\syswow64\\" .. l_0_10) then
          l_0_6 = true
        end
        if l_0_6 then
          return true
        end
        return false
      end
    end
  end
end

