-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a0db_421.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 100 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = tostring((mp.readfile)(0, 100))
if (string.find)(l_0_1, "\\rt[^f]") ~= nil or (string.find)(l_0_1, "\\rtf[^1]") ~= nil or (string.find)(l_0_1, "\\rtf1[^\\]") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

