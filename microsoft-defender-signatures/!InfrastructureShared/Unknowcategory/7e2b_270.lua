-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7e2b_270.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and peattributes.amd64_image and (mp.get_mpattribute)("NID:Win64/Bumblebee.PC!MTB") then
  return mp.INFECTED
end
return mp.CLEAN

