-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\4e7c_191.luac 

-- params : ...
-- function num : 0
if peattributes.amd64_image and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN

