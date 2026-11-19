-- Threat: !InfrastructureShared
-- Name: 30b39d37c1e9
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\endpoint agent\\edpa.exe", 1, true) or string.find(l_0_0, "\\program files (x86)\\internet explorer\\iexplore.exe", 1, true) or string.find(l_0_0, "mars\\microsoft azure recovery services agent\\bin\\cbengine.exe", 1, true) or string.find(l_0_0, "\\program files\\bitdefender\\endpoint security\\epsecurityservice.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
