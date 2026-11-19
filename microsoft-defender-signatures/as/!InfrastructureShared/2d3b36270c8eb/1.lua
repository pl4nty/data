-- Threat: !InfrastructureShared
-- Name: 2d3b36270c8eb
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p2:lower()
end
if contains(l_0_0, {
  "captcha",
  "human",
  "robot",
  "verif",
  "free",
  "ray",
  "cloudflare",
  "microsoft windows",
  "telegram",
  "DNS service",
  ".mp3",
  ".mp4",
  ".flv",
  ".mdb",
  ".eps",
  "-replace",
  ".dat",
  ".xll",
  ".m4a"
}) then
  return mp.INFECTED
end
return mp.CLEAN
