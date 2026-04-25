-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32ClickFixRDiaSE\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattributesubstring)("SCPT:Win32/ClickFix") then
  return mp.INFECTED
end
if (mp.get_mpattributesubstring)("SCRIPT:SuspClickfix") then
  return mp.INFECTED
end
if (mp.get_mpattributesubstring)("SCPT:Trojan:PowerShell/ClickFix") then
  return mp.INFECTED
end
if (mp.get_mpattributesubstring)("SCPT:Clickfix") then
  return mp.INFECTED
end
return mp.CLEAN

