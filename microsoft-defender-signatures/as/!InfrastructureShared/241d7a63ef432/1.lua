-- Threat: !InfrastructureShared
-- Name: 241d7a63ef432
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "ahsaycbs", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil or l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
local l_0_4 = string.match(l_0_3, "([^\\]+)$")
if not string.find(l_0_3, "\\ahsaycbs\\", 1, true) then
  return mp.CLEAN
end
if l_0_4 ~= "cbssvcx64.exe" then
  return mp.CLEAN
end
local l_0_5 = string.match(l_0_1, "^%s*\"([^\"]+)\"")
if l_0_5 == nil then
  l_0_5 = string.match(l_0_1, "^%s*([^%s]+)")
end
if l_0_5 == nil then
  return mp.CLEAN
end
l_0_5 = string.gsub(l_0_5, "/", "\\")
local l_0_6 = string.match(l_0_5, "([^\\]+)$")
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_7 = {
  ["cmd.exe"] = true,
  ["powershell.exe"] = true,
  ["whoami.exe"] = true,
  ["nltest.exe"] = true,
  ["net.exe"] = true,
  ["taskkill.exe"] = true,
  ["netsh.exe"] = true,
  ["reg.exe"] = true,
  ["schtasks.exe"] = true,
  ["winrm.exe"] = true,
  ["net1.exe"] = true,
  ["regsvr32.exe"] = true,
  ["wmic.exe"] = true,
  ["findstr.exe"] = true,
  ["curl.exe"] = true,
  ["wget.exe"] = true,
  ["certutil.exe"] = true,
  ["bitsadmin.exe"] = true,
  ["mshta.exe"] = true,
  ["rundll32.exe"] = true,
  ["cscript.exe"] = true,
  ["wscript.exe"] = true,
  ["powershell_ise.exe"] = true
}
if l_0_7[l_0_6] ~= true then
  return mp.CLEAN
end
return mp.INFECTED
