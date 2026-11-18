-- Threat: !InfrastructureShared
-- Name: 2ba9938060c4
-- Type: 21

local l_0_0 = string.lower(nri.GetHttpRequestHeader("User-Agent"))
if string.find(l_0_0, "medunja solodunnja", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
