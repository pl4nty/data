-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8681_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfile)(0, l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1:gsub("%+%$", "") > 20 then
  return mp.INFECTED
end
return mp.CLEAN

