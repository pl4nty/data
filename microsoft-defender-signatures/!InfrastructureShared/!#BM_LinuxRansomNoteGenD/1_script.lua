-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#BM_LinuxRansomNoteGenD\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("SCPT:LinuxClnWordsCat1")
if #l_0_0 > 0 then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("MpDisableCaching")
return mp.INFECTED

