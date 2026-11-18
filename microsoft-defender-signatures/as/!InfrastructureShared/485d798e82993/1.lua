-- Threat: !InfrastructureShared
-- Name: 485d798e82993
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
l_0_3 = string.lower(l_0_3)
if not l_0_3 then
  return mp.CLEAN
end
if #l_0_3 < 50 then
  return mp.CLEAN
end
local l_0_4 = MpCommon.GetImagePathFromPid(l_0_2)
if not contains(l_0_4, {
  "powershell",
  "mshta",
  "cmd"
}) then
  return mp.CLEAN
end
if not contains(l_0_3, {"http"}) then
  return mp.CLEAN
end
local l_0_5 = {
  "iex",
  "iwr",
  "irm",
  "curl",
  "bitsadmin",
  "e:jscript",
  "downloadstring",
  "invoke-restmethod",
  "invoke-webrequest",
  "invoke-expression",
  "start-process",
  "verif",
  "rundll32",
  "captcha",
  " ray",
  " recaptcha",
  " re captcha",
  " rcaptcha",
  "press enter",
  " clip free",
  " over free",
  "robot: r",
  "robot - r",
  "robot - cloudflare",
  "robot: cloudflare",
  "robot: captcha",
  "robot - captcha",
  "robot",
  "human - r",
  "human: r",
  "human: captcha",
  "human - captcha",
  "human",
  "/c start /min powershell",
  "microsoft windows: fix internet dns service reconnect",
  "restart dns service in the microsoft windows system",
  "microsoft  defender services secure access key"
}
if contains(l_0_3, l_0_5) then
  return mp.INFECTED
end
local l_0_6, l_0_7 = MpCommon.StringRegExpSearch("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+", l_0_3)
if l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
