-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7197_255.luac 

-- params : ...
-- function num : 0
if peattributes.suspicious_image_version and peattributes.lastscn_writable and peattributes.lastscn_executable then
  return mp.INFECTED
end
return mp.CLEAN

