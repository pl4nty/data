-- Threat: !InfrastructureShared
-- Name: !#SLF:PythonWheelDownload
-- Type: 13
-- MpAttributes: MpOnCloseNewlyCreatedHintRtpScan & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0:sub(-4) ~= ".whl" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_1 == nil or l_0_1 <= 0 or 209715200 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:lower():match("([^\\/]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  ["python.exe"] = true,
  ["pythonw.exe"] = true,
  ["pip.exe"] = true,
  ["uv.exe"] = true,
  ["poetry.exe"] = true,
  ["pipx.exe"] = true
}
if not l_0_3[l_0_2] and l_0_2:match("^python%d+%.exe$") == nil and l_0_2:match("^python%d+%.%d+%.exe$") == nil and l_0_2:match("^pip%d+%.exe$") == nil and l_0_2:match("^pip%d+%.%d+%.exe$") == nil then
  return mp.CLEAN
end
local l_0_4 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_4 == nil then
  return mp.CLEAN
end
if l_0_4:find("\\pip\\cache\\wheels\\", 1, true) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
