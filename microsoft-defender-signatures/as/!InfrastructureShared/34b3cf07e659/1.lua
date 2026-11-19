-- Threat: !InfrastructureShared
-- Name: 34b3cf07e659
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and string.match(this_sigattrlog[1].utf8p1, "%.scr$") == nil then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, true) == true then
  return mp.CLEAN
end
local l_0_1 = {
  ["multitip.exe"] = true,
  ["oawrapper.exe"] = true,
  ["kindle.exe"] = true,
  ["mysqlworkbench.exe"] = true,
  ["360se.exe"] = true,
  ["silhouette studio.exe"] = true,
  ["scrivener.exe"] = true,
  ["java.exe"] = true,
  ["scratch 2.exe"] = true
}
local l_0_2 = string.lower(l_0_0:match("\\([^\\]+)$"))
if l_0_1[l_0_2] then
  return mp.CLEAN
end
return mp.INFECTED
