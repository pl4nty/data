-- Threat: !InfrastructureShared
-- Name: 5dd7573588c8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
local l_0_2 = l_0_1:match("([^\\]+)$")
if not l_0_2 then
  return mp.CLEAN
end
if not contains(l_0_2, {
  "explorer.exe"
}) then
  return mp.CLEAN
end
local l_0_3 = mp.GetScannedPPID()
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = mp.GetProcessCommandLine(l_0_3)
if not l_0_4 then
  return mp.CLEAN
end
l_0_4 = string.lower(l_0_4)
if #l_0_4 < 50 then
  return mp.CLEAN
end
local l_0_5 = {
  " rem ",
  "#",
  "$$ ",
  "verif",
  "confirm",
  "identity",
  "verification",
  "not a robot",
  "\209\129\208\176\209\128tcha",
  "human",
  "authorized",
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
  "id:",
  "gatesig:",
  "defender services secure access key"
}
if contains(l_0_4, l_0_5) then
  return mp.INFECTED
end
return mp.CLEAN
