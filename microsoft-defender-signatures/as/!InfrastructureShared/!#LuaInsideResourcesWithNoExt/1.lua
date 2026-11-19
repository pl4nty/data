-- Threat: !InfrastructureShared
-- Name: !#Lua:InsideResourcesWithNoExt
-- Type: 12

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil or string.len(l_0_0) < 15 then
  return mp.CLEAN
end
if string.find(l_0_0, "->", 1, true) == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "/resources/", 1, true) == nil then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:InsideResources")
if string.match(l_0_0, "/resources/[^%.]+$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
