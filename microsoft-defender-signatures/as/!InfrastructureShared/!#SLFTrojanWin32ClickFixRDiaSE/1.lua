-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/ClickFixRDia.SE
-- Type: 13
-- MpAttributes: MpIsRunDialogAmsiScanContextWeb & (LUA:FileSizeLE800.A | LUA:FileSizeLE400.A | LUA:FileSizeLE200.A)

if mp.get_mpattributesubstring("SCPT:Win32/ClickFix") then
  return mp.INFECTED
end
if mp.get_mpattributesubstring("SCRIPT:SuspClickfix") then
  return mp.INFECTED
end
if mp.get_mpattributesubstring("SCPT:Trojan:PowerShell/ClickFix") then
  return mp.INFECTED
end
if mp.get_mpattributesubstring("SCPT:Clickfix") then
  return mp.INFECTED
end
return mp.CLEAN
