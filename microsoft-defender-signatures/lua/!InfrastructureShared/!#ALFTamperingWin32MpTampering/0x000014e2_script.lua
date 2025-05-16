-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTamperingWin32MpTampering\0x000014e2_luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("//scpt:TamperingReg_") >= 3 then
  return mp.INFECTED
end
return mp.CLEAN

