-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9d02_374.luac 

-- params : ...
-- function num : 0
if peattributes.isvbnative and peattributes.dirty_wx_branch and peattributes.hstr_exhaustive and peattributes.hasappendeddata then
  return mp.INFECTED
end
if not peattributes.suspicious_timestamp and not peattributes.suspicious_image_version then
  return mp.CLEAN
end
return mp.INFECTED

