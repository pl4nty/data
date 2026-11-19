-- Threat: !InfrastructureShared
-- Name: c1d7e16b5e5a
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.ppid == nil or l_0_1.ppid == "" then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1.ppid)
local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
local l_0_4 = {
  [".bat"] = true,
  [".cmd"] = true,
  [".ps1"] = true
}
local l_0_5 = 4
local l_0_6 = {
  ":\\saw\\system\\sawhealthcheck.ps1$",
  ":\\saw\\user\\sawhealthcheck.ps1$",
  "\\microsoft intune management extension\\policies\\scripts\\",
  ":\\windows\\imecache\\healthscripts\\.+%.ps1$",
  "\\vdi_scripts\\defenderatp\\defenderatp.ps1$",
  ":\\agent\\enableagent.ps1$",
  ":\\programdata\\amazon\\ssm\\.+\\runpowershellscript\\_script.ps1$",
  ":\\svcfab\\_app\\.+\\svc\\setupnightwatch.bat$",
  ":\\work\\cloudtest\\preconfig.cmd$",
  "%w\\bin\\defender%-exclusions.ps1$"
}
for l_0_7, l_0_8 in ipairs(l_0_3) do
  l_0_8 = mp.ContextualExpandEnvironmentVariables(l_0_8)
  if l_0_5 < string.len(l_0_8) then
    local l_0_9 = l_0_8:lower()
    local l_0_10 = string.sub(l_0_9, -l_0_5)
    if l_0_4[l_0_10] then
      local l_0_11 = false
      for l_0_12, l_0_13 in pairs(l_0_6) do
        if string.find(l_0_9, l_0_13, 1, false) then
          l_0_11 = true
          break
        end
      end
      if not l_0_11 and sysio.IsFileExists(l_0_8) then
        AppendToRollingQueue("ShellScripts", l_0_0 .. ",FilePath:" .. l_0_8, l_0_8, 3600, 100, 1)
        mp.ReportLowfi(l_0_8, 4064046355, {
          ReportingSig = "CMD:Trojan:Win32/WDAVTamper.A"
        })
      end
    end
  end
end
return mp.CLEAN
