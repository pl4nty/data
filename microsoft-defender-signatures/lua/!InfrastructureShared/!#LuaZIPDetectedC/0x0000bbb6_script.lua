-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaZIPDetectedC\0x0000bbb6_luac 

-- params : ...
-- function num : 0
if (mp.enum_mpattributesubstring)("MpContentDetected") or (mp.enum_mpattributesubstring)("Detection:") or (mp.enum_mpattributesubstring)("MpContainerContentDetected") then
  (mp.set_mpattribute)("Lua:ZIPDetected.C")
  return mp.INFECTED
end
return mp.CLEAN

