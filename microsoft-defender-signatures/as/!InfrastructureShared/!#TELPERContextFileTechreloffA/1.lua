-- Threat: !InfrastructureShared
-- Name: !#TELPER:ContextFileTechreloff.A
-- Type: 9

local l_0_0 = string.lower(mp.getfilename())
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if l_0_2 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if l_0_2:find("optin%[%d%]%.php") == 1 then
  return mp.INFECTED
end
return mp.CLEAN
