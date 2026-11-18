-- Threat: !InfrastructureShared
-- Name: 3a78cbd5ca9b
-- Type: 21

local l_0_0 = mp.getfilesize()
if 10000000 < l_0_0 then
  return mp.CLEAN
end
if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
