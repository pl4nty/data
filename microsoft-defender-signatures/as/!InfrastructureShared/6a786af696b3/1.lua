-- Threat: !InfrastructureShared
-- Name: 6a786af696b3
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if string.sub(l_0_1, -18) == "\\windows\\system32\\" or string.sub(l_0_1, -18) == "\\windows\\syswow64\\" then
  return mp.INFECTED
end
return mp.CLEAN
