-- Threat: !InfrastructureShared
-- Name: !#MultiFileTypeTrick.B!rsm
-- Type: 10

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:len() < 4 then
  return mp.CLEAN
end
local l_0_1 = string.sub(l_0_0, -4)
if l_0_1 == ".hta" then
  return mp.INFECTED
end
return mp.CLEAN
