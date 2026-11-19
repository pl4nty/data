-- Threat: !InfrastructureShared
-- Name: !#SLF:NewWrittenBySystemProcessDetected
-- Type: 11
-- MpAttributes: RPF:TopLevelFile & Lua:EXEExt & Lua:NewWrittenBySystemProcess & MpContentDetected

if not mp.get_mpattribute("MpContentDetected") and not mp.get_mpattributesubstring("Detection:Trojan:Win") and not mp.get_mpattributesubstring("Detection:HackTool:Win") and not mp.get_mpattributesubstring("Detection:RemoteAccess:Win") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if string.sub(l_0_0, 0, 4) == "\\\\?\\" then
  l_0_0 = string.sub(l_0_0, 5)
end
if l_0_0:sub(1, 8) == "\\device\\" then
  l_0_0 = MpCommon.PathToWin32Path(l_0_0)
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
end
if not string.find(l_0_0, "^c:\\windows\\%w+%.exe$") then
  return mp.CLEAN
end
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "NewWrittenBySystemProcessDetected")
if not l_0_1 then
  MpCommon.AppendPersistContext(l_0_0, "NewWrittenBySystemProcessDetected", 5)
end
return mp.INFECTED
