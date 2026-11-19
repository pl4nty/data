-- Threat: !InfrastructureShared
-- Name: e561b8e40f81
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 5376 < l_0_0 and l_0_0 < 6400 then
  return mp.INFECTED
end
return mp.CLEAN
