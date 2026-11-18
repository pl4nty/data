-- Threat: !InfrastructureShared
-- Name: 5061afe51ea4
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil and l_0_0 <= 393216 then
  return mp.INFECTED
end
return mp.CLEAN
