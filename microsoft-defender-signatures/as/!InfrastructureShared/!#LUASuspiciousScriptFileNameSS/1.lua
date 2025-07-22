-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUASuspiciousScriptFileNameSS\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or (string.len)(l_0_0) <= 5 then
  return mp.CLEAN
end
if (string.find)(l_0_0, "original shipiing doc%-awb%#%d%d%d%d%d+%.pdf%.html") ~= nil or (string.find)(l_0_0, "202507%d%d_fp_100_%d%d+%.eml") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

