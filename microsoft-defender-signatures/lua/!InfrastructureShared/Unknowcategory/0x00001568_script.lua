-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001568_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("PACKED_WITH:(EncScript)") then
  return mp.CLEAN
end
if ((mp.getfilename)()):match(".[zr][ia][pr].*.[jv][sb][es]?.*(EncScript)") then
  return mp.INFECTED
end
return mp.CLEAN

