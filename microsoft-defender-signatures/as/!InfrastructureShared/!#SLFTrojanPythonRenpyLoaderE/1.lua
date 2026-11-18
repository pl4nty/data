-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Python/RenpyLoader.E
-- Type: 13
-- MpAttributes: Lua:PYExt

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if not l_0_0 or l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "data\\python-packages\\planner\\__init__.py", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
