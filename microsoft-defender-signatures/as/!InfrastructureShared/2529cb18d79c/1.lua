-- Threat: !InfrastructureShared
-- Name: 2529cb18d79c
-- Type: 21

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "\\windows\\ccmcache\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "\\windows\\ccm\\systemtemp\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "\\microsoft\\windows defender advanced threat protection\\", 1, true) then
  return mp.CLEAN
end
if mp.IsTrustedFile(false) == true then
  return mp.CLEAN
end
return mp.INFECTED
