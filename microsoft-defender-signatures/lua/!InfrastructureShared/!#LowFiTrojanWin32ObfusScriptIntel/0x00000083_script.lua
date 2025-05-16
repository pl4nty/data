-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LowFiTrojanWin32ObfusScriptIntel\0x00000083_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (string.lower)((string.match)(l_0_1, "(%.[^%.]+)$"))
local l_0_3 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC57: Unhandled construct in 'MakeBoolean' P1

if l_0_3 == "powershell.exe" and l_0_2 ~= ".ps1" then
  return mp.CLEAN
end
if l_0_3 ~= "cscript.exe" and l_0_3 ~= "wscript.exe" then
  return mp.CLEAN
end
if l_0_2 ~= ".js" and l_0_2 ~= ".vbs" then
  return mp.CLEAN
end
if (mp.get_mpattribute)("ObfuscatedScriptA") then
  (mp.ReportLowfi)((mp.getfilename)(), 2889548347)
else
  if (mp.get_mpattribute)("ObfuscatedScriptB") then
    (mp.ReportLowfi)((mp.getfilename)(), 892490625)
  else
    if (mp.get_mpattribute)("ObfuscatedScriptC") then
      (mp.ReportLowfi)((mp.getfilename)(), 1110795031)
    else
      if (mp.get_mpattribute)("ObfuscatedScriptD") then
        (mp.ReportLowfi)((mp.getfilename)(), 3696359092)
      else
        return mp.CLEAN
      end
    end
  end
end
;
(mp.set_mpattribute)("MpDisableCaching")
return mp.INFECTED

