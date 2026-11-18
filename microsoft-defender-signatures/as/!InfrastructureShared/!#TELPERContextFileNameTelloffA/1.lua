-- Threat: !InfrastructureShared
-- Name: !#TELPER:ContextFileNameTelloff.A
-- Type: 9

local l_0_0 = string.lower(mp.getfilename())
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if l_0_2 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1:len() > 30 and l_0_1:find("\\temp\\...........?.?\\......?.?.?.?_stp\\") then
  return mp.INFECTED
end
return mp.CLEAN
