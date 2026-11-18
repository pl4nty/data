-- Threat: !InfrastructureShared
-- Name: 15b35d60e260
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "osascript", 1, true) or string.find(l_0_0, "perl", 1, true) or string.find(l_0_0, "python", 1, true) or string.match(l_0_0, "/bin/%a*sh") then
  return mp.INFECTED
end
return mp.CLEAN
