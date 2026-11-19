-- Threat: \xd0!SuspMaliciousXSL.AM
-- Type: 24
-- Includes: ResearchData, BMLuaLib
-- MpAttributes: (RPF:TopLevelFile) & (Lua:TopLevelUnsigned)

local l_0_0 = mp.getfilesize()
if isnull(l_0_0) then
  return mp.CLEAN
end
if l_0_0 < 30 or 1000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_1, "%.xsl$") or string.find(l_0_1, "%.xslt$")
if not l_0_2 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = tostring(l_0_3)
local l_0_4 = string.lower(l_0_3)
if not string.find(l_0_4, "xsl:stylesheet", 1, true) and not string.find(l_0_4, "xsl:transform", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_4, "msxsl:script", 1, true) then
  return mp.CLEAN
end
local l_0_5 = 0
local l_0_6 = false
if string.find(l_0_4, "language=\"jscript\"", 1, true) or string.find(l_0_4, "language='jscript'", 1, true) or string.find(l_0_4, "language=\"javascript\"", 1, true) or string.find(l_0_4, "language='javascript'", 1, true) then
  l_0_5 = l_0_5 + 5
end
if string.find(l_0_4, "language=\"vbscript\"", 1, true) or string.find(l_0_4, "language='vbscript'", 1, true) then
  l_0_5 = l_0_5 + 5
end
if string.find(l_0_4, "wscript.shell", 1, true) then
  l_0_5 = l_0_5 + 4
  l_0_6 = true
end
if string.find(l_0_4, "shell.application", 1, true) then
  l_0_5 = l_0_5 + 3
  l_0_6 = true
end
if string.find(l_0_4, "shellexecute", 1, true) then
  l_0_5 = l_0_5 + 3
  l_0_6 = true
end
if string.find(l_0_4, "powershell", 1, true) then
  l_0_5 = l_0_5 + 3
  l_0_6 = true
end
if string.find(l_0_4, "cmd.exe", 1, true) then
  l_0_5 = l_0_5 + 2
  l_0_6 = true
end
if string.find(l_0_4, "cmd /c", 1, true) then
  l_0_5 = l_0_5 + 2
  l_0_6 = true
end
if string.find(l_0_4, "executeglobal", 1, true) then
  l_0_5 = l_0_5 + 2
  l_0_6 = true
end
if string.find(l_0_4, "activexobject", 1, true) then
  l_0_5 = l_0_5 + 4
end
if string.find(l_0_4, "scripting.filesystemobject", 1, true) then
  l_0_5 = l_0_5 + 3
end
if string.find(l_0_4, "msxml2.xmlhttp", 1, true) then
  l_0_5 = l_0_5 + 3
end
if string.find(l_0_4, "winhttp", 1, true) then
  l_0_5 = l_0_5 + 2
end
if string.find(l_0_4, "internetexplorer.application", 1, true) then
  l_0_5 = l_0_5 + 2
end
if string.find(l_0_4, ".run(", 1, true) then
  l_0_5 = l_0_5 + 1
end
if string.find(l_0_4, ".exec(", 1, true) then
  l_0_5 = l_0_5 + 1
end
if string.find(l_0_4, "eval(", 1, true) then
  l_0_5 = l_0_5 + 1
end
if string.find(l_0_4, "execute(", 1, true) then
  l_0_5 = l_0_5 + 2
end
if string.find(l_0_4, "frombase64string", 1, true) or string.find(l_0_4, "atob(", 1, true) then
  l_0_5 = l_0_5 + 2
end
if not l_0_6 then
  return mp.CLEAN
end
if l_0_5 < 8 then
  return mp.CLEAN
end
set_research_data("malicious_xsl_path", l_0_1, false)
set_research_data("malicious_xsl_score", tostring(l_0_5), false)
set_research_data("malicious_xsl_size", tostring(l_0_0), false)
return mp.INFECTED
