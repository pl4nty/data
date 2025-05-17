-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERHackToolPythonBeForceA!dh\1.luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("SCPT:BeForce.A") == 1 and #(mp.enum_mpattributesubstring)("SCPT:BeForce.B") >= 8 then
  return mp.INFECTED
end
return mp.CLEAN

