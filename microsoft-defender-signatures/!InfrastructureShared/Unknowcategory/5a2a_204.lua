-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5a2a_204.luac 

-- params : ...
-- function num : 0
if peattributes.x86_image and peattributes.suspicious_dosheader then
  return mp.INFECTED
end
return mp.CLEAN

