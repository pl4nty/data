-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a57_269.luac 

-- params : ...
-- function num : 0
if elfhdr.type == 2 or elfhdr.type == 3 then
  return mp.INFECTED
end
if (mp.get_mpattribute)("Linux:HSTR:UPX_Packed") then
  return mp.INFECTED
end
return mp.CLEAN

