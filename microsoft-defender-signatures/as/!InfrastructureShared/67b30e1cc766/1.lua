-- Threat: !InfrastructureShared
-- Name: 67b30e1cc766
-- Type: 21
-- Includes: BMLuaLib

if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p1
local l_0_1 = this_sigattrlog[2].utf8p2
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_0, "([^/]+)$")
if l_0_2 ~= "sh" and l_0_2 ~= "bash" and l_0_2 ~= "dash" then
  return mp.CLEAN
end
if not containsall(l_0_1, {
  "php -r ",
  "array_filter(",
  "sys_get_temp_dir()",
  "upload_tmp_dir",
  "rawurldecode(",
  "is_writable(",
  "file_put_contents(",
  "include",
  "finally",
  "@unlink(",
  "die(",
  "!notwrtbl!"
}) then
  return mp.CLEAN
end
return mp.INFECTED
