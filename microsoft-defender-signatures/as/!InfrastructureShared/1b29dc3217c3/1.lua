-- Threat: !InfrastructureShared
-- Name: 1b29dc3217c3
-- Type: 21
-- Includes: ResearchData, TechniqueTracker

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
local l_0_1 = {
  module = l_0_0:match("\"module\"%s*:%s*\"([^\"]+)\""),
  import = l_0_0:match("\"import\"%s*:%s*\"([^\"]+)\""),
  require = l_0_0:match("\"require\"%s*:%s*\"([^\"]+)\""),
  preinstall = l_0_0:match("\"preinstall\"%s*:%s*\"([^\"]+)\""),
  install = l_0_0:match("\"install\"%s*:%s*\"([^\"]+)\""),
  postinstall = l_0_0:match("\"postinstall\"%s*:%s*\"([^\"]+)\""),
  prepare = l_0_0:match("\"prepare\"%s*:%s*\"([^\"]+)\"")
}
local l_0_2 = false
for l_0_3, l_0_4 in pairs(l_0_1) do
  l_0_2 = true
  set_research_data("PackageJson_" .. l_0_3, l_0_4, false)
  mp.set_mpattribute("//SCPT:PackageJson_" .. l_0_3)
  mp.set_mpattribute("//SCPT:PackageJson_" .. l_0_3 .. "=" .. l_0_4)
end
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
