-- Threat: !InfrastructureShared
-- Name: !#Lua:JSOB.FileSize
-- Type: 13

local l_0_0 = mp.getfilesize()
if 550000 < l_0_0 and l_0_0 < 600000 then
  return mp.INFECTED
end
if 120000 < l_0_0 and l_0_0 < 300000 then
  return mp.INFECTED
end
if 40000 < l_0_0 and l_0_0 < 70000 then
  return mp.INFECTED
end
if 10000 < l_0_0 and l_0_0 < 15000 then
  return mp.INFECTED
end
if 7600 < l_0_0 and l_0_0 < 7700 then
  return mp.INFECTED
end
if 4100 < l_0_0 and l_0_0 < 4300 then
  return mp.INFECTED
end
return mp.CLEAN
