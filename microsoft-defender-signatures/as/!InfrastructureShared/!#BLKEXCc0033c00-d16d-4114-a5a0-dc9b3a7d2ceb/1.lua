-- Threat: !InfrastructureShared
-- Name: !#BLKEXC:c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb
-- Type: 33

if not mp.IsHipsRuleEnabled("c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb") then
  return false
end
local l_0_0 = ImageConfig.GetImagePath()
if l_0_0 == nil or l_0_0 == "" then
  return false
end
local l_0_1 = MpCommon.PathToWin32Path(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return false
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = MpCommon.ExpandEnvironmentVariables("%systemroot%")
if l_0_2 == nil or l_0_2 == "" then
  return false
end
l_0_2 = MpCommon.PathToWin32Path(l_0_2)
if l_0_2 == nil or l_0_2 == "" then
  return false
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_1, l_0_2, 1, true) ~= nil then
  return false
end
if string.find(l_0_1, ":\\$winreagent\\", 1, true) ~= nil then
  return false
end
if string.find(l_0_1, ":\\mount[^\\]*\\windows\\winsxs\\temp\\pendingrenames\\") ~= nil then
  return false
end
if string.sub(l_0_1, 2, 12) == ":\\$windows." then
  return false
end
if string.find(l_0_1, ":\\windows.old\\", 1, true) ~= nil then
  return false
end
if string.find(l_0_1, ":\\$sysreset\\", 1, true) ~= nil then
  return false
end
if string.find(l_0_1, ":\\winpe\\windows\\", 1, true) ~= nil then
  return false
end
local l_0_3 = string.lower(MpCommon.ExpandEnvironmentVariables("%programfiles%"))
if l_0_3 ~= nil and string.find(l_0_1, l_0_3, 1, true) ~= nil then
  if string.find(l_0_1, ":\\program files\\windowsapps\\", 1, true) ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files\\git\\", 1, true) ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\java\\jre[^\\]*\\bin\\") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\java\\jdk[^\\]*\\bin\\") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\java\\jre[^\\]*\\bin\\") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files\\sharp\\file-copy\\robocopy.exe", 1, true) ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files\\wsl\\wsl.exe", 1, true) ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\microsoft onedrive\\standaloneupdater\\onedrivesetup.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\microsoft onedrive\\[%d%.]+\\onedrivesetup.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\microsoft onedrive\\update\\onedrivesetup.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\microsoft office\\root\\client\\appvdllsurrogate%d*%.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\microsoft office\\updates\\download\\packagefiles\\[^\\]+\\root\\client\\appvdllsurrogate%d*%.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\common files\\microsoft shared\\") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\") ~= nil then
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return false
    end
    if string.find(l_0_1, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return false
    end
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\wsl\\wslg.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\windows kits\\%d+\\app certification kit\\aitstatic.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\program files[^\\]*\\sophos\\endpoint defense\\sophosna.exe") ~= nil then
    return false
  end
else
  if string.find(l_0_1, "\\appdata\\local\\microsoft\\onedrive\\standaloneupdater\\onedrivesetup.*%.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, "\\appdata\\local\\microsoft\\onedrive\\update\\onedrivesetup.*%.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, "\\appdata\\local\\microsoft\\onedrive\\[%d%.]+\\onedrivesetup.*%.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\programdata\\microsoft\\grouppolicy\\users\\[^\\]+\\datastore\\0\\sysvol\\fcc%.intfcc%.local\\policies\\[^\\]+\\user\\[^\\]+\\logon\\bginfo%.exe") ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\programdata\\docker\\windowsfilter\\", 1, true) ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\programdata\\dell\\saremediation\\systemrepair\\snapshots\\", 1, true) ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\programdata\\dell\\saremediation\\tempdrivers\\dell", 1, true) ~= nil then
    return false
  end
  if string.find(l_0_1, ":\\programdata\\microsoft\\windows defender\\platform\\[^\\]+\\mpcmdrun.exe") ~= nil then
    return false
  end
end
local l_0_4 = string.match(l_0_1, "\\([^\\]+)$")
if l_0_4 == nil or l_0_4 == "" then
  return false
end
l_0_4 = string.lower(l_0_4)
if l_0_4 == "mpsigstub.exe" then
  if string.find(l_0_1, "[a-z]:\\{00000000%-0000%-0000%-0000%-000000000000}\\svroot\\windows\\temp\\[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$") ~= nil then
    return false
  end
  if string.find(l_0_1, "[a-z]:\\program files[^\\]+\\tanium\\tanium client\\data\\temp\\[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$") ~= nil then
    return false
  end
  if string.find(l_0_1, "[a-z]:\\users\\.+\\appdata\\local\\temp\\[%d\\]*[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$") ~= nil then
    return false
  end
  if string.find(l_0_1, "[a-z]:\\programdata\\microsoft\\windows defender\\platform\\[^\\]+\\mpsigstub%.exe$") ~= nil then
    return false
  end
end
if l_0_4 == "klist.exe" and string.find(l_0_1, ":\\program files[^\\]*\\.+\\jre\\bin\\") ~= nil then
  return false
end
local l_0_5 = false
local l_0_6 = {
  l_0_2 .. "\\system32\\",
  l_0_2 .. "\\syswow64\\",
  l_0_2 .. "\\system32\\windowspowershell\\v1.0\\",
  l_0_2 .. "\\syswow64\\windowspowershell\\v1.0\\"
}
local l_0_7 = sysio.GetPEVersionInfo(l_0_1)
if l_0_7 ~= nil and l_0_7.OriginalFilename ~= nil then
  local l_0_8 = string.lower(l_0_7.OriginalFilename)
  local l_0_9
  l_0_9 = string.match(l_0_8, "%.([^%.]+)$")
  if l_0_9 == nil then
    l_0_8 = l_0_8 .. ".exe"
    l_0_9 = "exe"
  end
  if l_0_9 == "exe" then
    if string.find(l_0_8, "onedrivesetup.*%.exe") ~= nil then
      return false
    end
    for l_0_10 = 1, #l_0_6 do
      if not l_0_5 and sysio.IsFileExists(l_0_6[l_0_10] .. l_0_8) then
        l_0_5 = true
      end
    end
  end
end
if not l_0_5 and string.match(l_0_4, "(%.[^%.]+)$") == ".exe" then
  for l_0_11 = 1, #l_0_6 do
    if not l_0_5 and sysio.IsFileExists(l_0_6[l_0_11] .. l_0_4) then
      l_0_5 = true
    end
  end
end
if not l_0_5 then
  local l_0_12 = MpCommon.GetOriginalFileName(l_0_0)
  if l_0_12 ~= nil and l_0_12 ~= "" then
    local l_0_13
    l_0_13 = string.match(l_0_12, "%.([^%.]+)$")
    if l_0_13 == nil then
      l_0_12 = l_0_12 .. ".exe"
      l_0_13 = "exe"
    end
    l_0_13 = string.lower(l_0_13)
    if l_0_13 == "exe" then
      for l_0_14 = 1, #l_0_6 do
        if not l_0_5 and sysio.IsFileExists(l_0_6[l_0_14] .. l_0_12) then
          l_0_5 = true
        end
      end
    end
  end
end
if l_0_5 then
  return true
end
return false
