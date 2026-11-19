-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:LNK/SuspProcinISO.SA
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: (Lua:OpenLnkCrossVolume_CdToSys | Lua:OpenLnkCrossVolume_CdToSysRel)

local l_0_0 = mp.GetLnkInfo()
local l_0_1 = l_0_0.Arguments
if isnull(l_0_1) then
  l_0_1 = l_0_0.RelativePath
end
l_0_1 = l_0_1:lower()
local l_0_2 = {
  "odbcconf",
  "rundll32",
  "regsvr32",
  "powershell",
  "calc",
  "wscript",
  "cscript",
  "mshta",
  ".cmd",
  ".bat",
  "..\\.."
}
if contains(l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
