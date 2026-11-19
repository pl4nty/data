-- Threat: !InfrastructureShared
-- Name: 4e78140a7673
-- Type: 21

local l_0_0 = mp.getfilename()
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if string.lower(l_0_2) == "mpkview.exe" then
  return mp.INFECTED
end
return mp.LOWFI
