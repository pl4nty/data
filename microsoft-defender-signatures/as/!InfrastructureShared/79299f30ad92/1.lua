-- Threat: !InfrastructureShared
-- Name: 79299f30ad92
-- Type: 21

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_AMSI_CONTENTNAME))
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
