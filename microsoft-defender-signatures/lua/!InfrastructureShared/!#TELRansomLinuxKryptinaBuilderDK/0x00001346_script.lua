-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELRansomLinuxKryptinaBuilderDK\0x00001346_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 >= 51200 then
  return mp.CLEAN
end
local l_0_1 = (mp.enum_mpattributesubstring)("SCPT:KryptinaRansomCfg_")
if #l_0_1 >= 10 then
  return mp.INFECTED
end
if #l_0_1 >= 7 and #(mp.enum_mpattributesubstring)("SCPT:KryptinaRansom_3") > 0 then
  return mp.INFECTED
end
return mp.CLEAN

