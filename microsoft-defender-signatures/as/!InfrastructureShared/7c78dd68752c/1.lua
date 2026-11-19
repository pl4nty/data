-- Threat: !InfrastructureShared
-- Name: 7c78dd68752c
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1007616 < l_0_0 and l_0_0 < 1044480 then
  return mp.INFECTED
end
return mp.CLEAN
