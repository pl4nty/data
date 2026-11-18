-- Threat: !InfrastructureShared
-- Name: 3db369dc3c87
-- Type: 21

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.match(l_0_0, "[^\\]+$")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  ["tclsh.exe"] = true,
  ["wish.exe"] = true,
  ["php.exe"] = true,
  ["php-cgi.exe"] = true,
  ["julia.exe"] = true,
  ["dart.exe"] = true,
  ["java.exe"] = true,
  ["node.exe"] = true,
  ["bun.exe"] = true,
  ["python.exe"] = true,
  ["pythonw.exe"] = true,
  ["fsi.exe"] = true,
  ["fsianycpu.exe"] = true,
  ["deno.exe"] = true
}
if not l_0_2[l_0_1] then
  return mp.CLEAN
end
return mp.INFECTED
