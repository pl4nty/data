-- Threat: !InfrastructureShared
-- Name: f5784558c8c3
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("system32", 1, true) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.find(l_0_1, "->")
if l_0_2 then
  l_0_1 = string.sub(l_0_1, 1, l_0_2 - 1)
end
return mp.INFECTED
