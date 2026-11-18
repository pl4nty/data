-- Threat: !InfrastructureShared
-- Name: 32d04b5fedd2
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.getfilename()
if l_0_0 then
  l_0_0 = string.lower(l_0_0)
  if contains(l_0_0, "code\\user\\settings.json") then
    return mp.INFECTED
  end
end
return mp.CLEAN
