-- Threat: !InfrastructureShared
-- Name: 14f78c4e1be6a
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil and 663552 <= l_0_0 and l_0_0 <= 715008 then
  return mp.INFECTED
end
return mp.CLEAN
