-- Threat: !InfrastructureShared
-- Name: 128780a649c47
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 3145728 <= l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
