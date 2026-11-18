-- Threat: !InfrastructureShared
-- Name: 35b357c6761d
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(l_0_0, "\\microsoft visual studio\\20", 1, true) or string.find(l_0_0, "\\program files (x86)\\msbuild\\1", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
