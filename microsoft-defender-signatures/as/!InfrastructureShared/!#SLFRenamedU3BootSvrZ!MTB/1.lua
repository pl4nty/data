-- Threat: !InfrastructureShared
-- Name: !#SLF:RenamedU3BootSvr.Z!MTB
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: OFN:U3BoostSvr.exe

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
if not StringEndsWith(l_0_0, ".exe") then
  return mp.CLEAN
end
local l_0_1 = {
  "\\program files",
  "\\program files (x86)"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {
  "\\programdata\\",
  "\\users\\",
  "\\windows\\temp\\"
}
if not contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = MpCommon.GetOriginalFileName(l_0_0)
if not l_0_3 or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_0, "[^\\]+$") or ""
if l_0_3 and l_0_3 ~= "" and l_0_4 ~= "" then
  local l_0_5 = string.lower(l_0_3)
  local l_0_6 = string.lower(l_0_4)
  if l_0_5 == "u3boostsvr.exe" and l_0_6 ~= l_0_5 then
    return mp.INFECTED
  end
end
return mp.CLEAN
