-- Threat: !InfrastructureShared
-- Name: 957838689667
-- Type: 21

local l_0_0 = mp.getfilesize()
if 2000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("threatsieve", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("pc-sdk-setup", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("processcheck", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("empengine", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("browser", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("lhshield", 1, true) then
  return mp.CLEAN
end
if l_0_1:find(".arx", 1, true) then
  return mp.CLEAN
end
if l_0_1:find(".zrx", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
