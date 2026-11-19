-- Threat: !InfrastructureShared
-- Name: 2729f38a9f88
-- Type: 21

mp.set_mpattribute("LUA:Script/Stealer.HAX2")
local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 4500 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_1:match("\"preinstall\"%s*:%s*\"([^\"]+)\"")
if l_0_2 == nil or #l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_3 = string.find(l_0_2, "curl", 1, true) or string.find(l_0_2, "wget", 1, true)
local l_0_4 = string.find(l_0_2, "| sh", 1, true) or string.find(l_0_2, "| bash", 1, true) or string.find(l_0_2, "&& sh", 1, true) or string.find(l_0_2, "&& bash", 1, true)
local l_0_5 = string.find(l_0_2, "-d", 1, true) or string.find(l_0_2, "--data", 1, true) or string.find(l_0_2, "base64", 1, true)
if l_0_3 and (l_0_4 or l_0_5) then
  return mp.INFECTED
end
return mp.CLEAN
