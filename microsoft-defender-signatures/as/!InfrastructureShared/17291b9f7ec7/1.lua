-- Threat: !InfrastructureShared
-- Name: 17291b9f7ec7
-- Type: 21

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") and not mp.get_mpattribute("MpIsRunDialogAmsiScan") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCRIPT:SuspClickfix.A") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 512 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetBruteMatchData()
local l_0_2 = ""
if l_0_1.is_header then
  l_0_2 = tostring(headerpage)
else
  l_0_2 = tostring(footerpage)
end
l_0_2 = string.lower(l_0_2)
l_0_2 = string.gsub(l_0_2, "%z", "")
l_0_2 = string.gsub(l_0_2, " ", "")
l_0_2 = string.gsub(l_0_2, "'%+'", "")
l_0_2 = string.gsub(l_0_2, "'", "")
l_0_2 = string.gsub(l_0_2, "`", "")
local l_0_3 = false
local l_0_4 = false
local l_0_5 = false
if string.find(l_0_2, "http", 1, true) or string.find(l_0_2, "ptth", 1, true) or string.find(l_0_2, "ahr0c", 1, true) or string.find(l_0_2, "://", 1, true) or string.find(l_0_2, "|clip", 1, true) or string.find(l_0_2, "::toint32($", 1, true) or string.find(l_0_2, "get-clipboard", 1, true) or string.find(l_0_2, "-q=txt", 1, true) or string.find(l_0_2, "-useba", 1, true) or string.find(l_0_2, "%.%a%a%a/") or string.find(l_0_2, "%d+%.%d+%.%d+%.%d+") then
  l_0_3 = true
end
if string.find(l_0_2, "iwr", 1, true) or string.find(l_0_2, "irm", 1, true) or string.find(l_0_2, "invoke-webrequest", 1, true) or string.find(l_0_2, "invoke-restmethod", 1, true) or string.find(l_0_2, "downloadstring", 1, true) or string.find(l_0_2, "nslookup", 1, true) or string.find(l_0_2, "curl", 1, true) or string.find(l_0_2, ".open(", 1, true) or string.find(l_0_2, "getstringasync", 1, true) then
  l_0_4 = true
end
if string.find(l_0_2, ".invoke()", 1, true) or string.find(l_0_2, ";&$", 1, true) or string.find(l_0_2, "&([scriptblock", 1, true) or string.find(l_0_2, ".([scriptblock", 1, true) or string.find(l_0_2, "icm([scriptblock", 1, true) or string.find(l_0_2, ";&(", 1, true) or string.find(l_0_2, ".invokereturnasis(", 1, true) or string.find(l_0_2, "invoke-command", 1, true) or string.find(l_0_2, "start-job", 1, true) or string.find(l_0_2, "[scriptblock]::create($", 1, true) or string.find(l_0_2, "::create%(%$.+%)%.%$.+%(%)") then
  l_0_5 = true
end
if l_0_3 and l_0_4 and l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
