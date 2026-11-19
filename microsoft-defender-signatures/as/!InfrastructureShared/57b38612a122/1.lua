-- Threat: !InfrastructureShared
-- Name: 57b38612a122
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2:lower()
end
if not l_0_0 then
  return mp.CLEAN
end
if contains(l_0_0, {
  "captcha",
  "human",
  "robo",
  "verif",
  "free",
  "ray",
  "cloudflare",
  "microsoft windows",
  "telegram",
  ".mp3",
  ".mp4",
  ".flv",
  ".mdb",
  ".eps",
  "-replace",
  "DNS service",
  ".dat",
  ".xll",
  ".m4a"
}) then
  return mp.INFECTED
end
return mp.CLEAN
