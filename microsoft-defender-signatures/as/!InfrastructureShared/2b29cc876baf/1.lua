-- Threat: !InfrastructureShared
-- Name: 2b29cc876baf
-- Type: 21

local l_0_0
l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_0 == nil or string.len(l_0_0) == 0 then
  l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
  if l_0_0 == nil or string.len(l_0_0) == 0 then
    return mp.CLEAN
  end
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "^.:\\windows\\ccmcache\\") then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "^.:\\(program files[^\\]*)\\tanium\\tanium client\\")
if l_0_1 == "program files" then
  return mp.CLEAN
end
if l_0_1 == "program files (x86)" then
  return mp.CLEAN
end
return mp.INFECTED
