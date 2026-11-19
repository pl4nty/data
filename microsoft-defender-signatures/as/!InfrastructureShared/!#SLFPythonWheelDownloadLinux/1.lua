-- Threat: !InfrastructureShared
-- Name: !#SLF:PythonWheelDownloadLinux
-- Type: 13
-- MpAttributes: MpOnModifiedCloseRtpScan & RPF:TopLevelFile

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
l_0_2 = l_0_2:lower():match("([^/]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  python = true,
  pip = true,
  uv = true,
  poetry = true,
  pipx = true
}
if not l_0_3[l_0_2] and l_0_2:match("^python%d+$") == nil and l_0_2:match("^python%d+%.%d+t?$") == nil and l_0_2:match("^pip%d+$") == nil and l_0_2:match("^pip%d+%.%d+$") == nil then
  return mp.CLEAN
end
local l_0_4 = mp.getfilename(0)
if l_0_4 == nil then
  return mp.CLEAN
end
if l_0_4:find("/pip/wheels/", 1, true) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
