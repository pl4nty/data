-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\753c_262.luac 

-- params : ...
-- function num : 0
if peattributes.isexe and peattributes.x86_image and peattributes.no_security and peattributes.requests_elevation then
  return mp.INFECTED
end
return mp.CLEAN

