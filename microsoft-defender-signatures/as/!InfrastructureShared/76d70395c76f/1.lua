-- Threat: !InfrastructureShared
-- Name: 76d70395c76f
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
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
if #l_0_3 < 50 then
  return mp.CLEAN
end
if not contains(l_0_3, {"http"}) then
  return mp.CLEAN
end
local l_0_4 = {
  "iex",
  "iwr",
  "irm",
  "curl",
  "e:jscript",
  "invoke-restmethod",
  "invoke-webrequest",
  "invoke-expression",
  "start-process",
  "verif",
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
  "human - r",
  "human: r",
  "human: captcha",
  "human - captcha",
  "microsoft windows: fix internet dns service reconnect",
  "restart dns service in the microsoft windows system",
  "defender services secure access key"
}
if contains(l_0_3, l_0_4) then
  return mp.INFECTED
end
local l_0_5, l_0_6 = MpCommon.StringRegExpSearch("-w[indowstyle]*\\s+(?:h[iden]*|1)\\s+", l_0_3)
if l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
