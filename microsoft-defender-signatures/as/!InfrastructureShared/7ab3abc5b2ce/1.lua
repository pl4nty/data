-- Threat: !InfrastructureShared
-- Name: 7ab3abc5b2ce
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\monagentcore.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
