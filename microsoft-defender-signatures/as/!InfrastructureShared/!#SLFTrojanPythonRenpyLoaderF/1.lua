-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Python/RenpyLoader.F
-- Type: 13
-- MpAttributes: Lua:PYExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if not l_0_1 or not l_0_0 then
  return mp.CLEAN
end
if l_0_0 == "__init__.py" and string.match(l_0_1, "\\data\\python%-packages\\[^\\]+\\__init__%.py$") then
  return mp.INFECTED
end
return mp.CLEAN
