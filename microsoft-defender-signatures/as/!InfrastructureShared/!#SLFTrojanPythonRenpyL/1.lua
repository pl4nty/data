-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPythonRenpyL\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if not l_0_1 or not l_0_0 then
  return mp.CLEAN
end
if l_0_0 == "__init__.py" and (string.match)(l_0_1, "\\data\\python%-packages\\[^\\]+\\__init__%.py$") then
  return mp.INFECTED
end
return mp.CLEAN

