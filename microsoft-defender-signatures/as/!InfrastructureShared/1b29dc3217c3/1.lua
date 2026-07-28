-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1b29dc3217c3\1.luac 

-- params : ...
-- function num : 0
if mp.HEADERPAGE_SZ < 10 then
  return mp.CLEAN
end
local l_0_0 = tostring(headerpage)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = normalize_unicode(l_0_0)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1.module = l_0_0:match("\"module\"%s*:%s*\"([^\"]+)\"")
l_0_1.import = l_0_0:match("\"import\"%s*:%s*\"([^\"]+)\"")
l_0_1.require = l_0_0:match("\"require\"%s*:%s*\"([^\"]+)\"")
l_0_1.preinstall = l_0_0:match("\"preinstall\"%s*:%s*\"([^\"]+)\"")
l_0_1.install = l_0_0:match("\"install\"%s*:%s*\"([^\"]+)\"")
l_0_1.postinstall = l_0_0:match("\"postinstall\"%s*:%s*\"([^\"]+)\"")
l_0_1.prepare = l_0_0:match("\"prepare\"%s*:%s*\"([^\"]+)\"")
local l_0_2 = false
for l_0_6,l_0_7 in pairs(l_0_1) do
  l_0_2 = true
  set_research_data("PackageJson_" .. l_0_6, l_0_7, false)
  ;
  (mp.set_mpattribute)("//SCPT:PackageJson_" .. l_0_6)
  ;
  (mp.set_mpattribute)("//SCPT:PackageJson_" .. l_0_6 .. "=" .. l_0_7)
end
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN

