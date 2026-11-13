-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFPythonWheelDownload\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0:sub(-4) ~= ".whl" then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if l_0_1 == nil or l_0_1 <= 0 or l_0_1 > 209715200 then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (l_0_2:lower()):match("([^\\/]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3["python.exe"] = true
l_0_3["pythonw.exe"] = true
l_0_3["pip.exe"] = true
l_0_3["uv.exe"] = true
l_0_3["poetry.exe"] = true
l_0_3["pipx.exe"] = true
if not l_0_3[l_0_2] and l_0_2:match("^python%d+%.exe$") == nil and l_0_2:match("^python%d+%.%d+%.exe$") == nil and l_0_2:match("^pip%d+%.exe$") == nil and l_0_2:match("^pip%d+%.%d+%.exe$") == nil then
  return mp.CLEAN
end
local l_0_4 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_4 == nil then
  return mp.CLEAN
end
if l_0_4:find("\\pip\\cache\\wheels\\", 1, true) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED

