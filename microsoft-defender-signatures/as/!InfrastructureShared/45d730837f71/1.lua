-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\45d730837f71\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = getAndDecodePowershellEncodedCommand("CMDHSTR", 800)
if l_0_0 == nil or #l_0_0 <= 50 or #l_0_0 >= 800 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "invoke-webrequest -usebasicparsing", 1, true) ~= nil and (string.find)(l_0_0, " | invoke-expression", 1, true) ~= nil then
  return mp.INFECTED
end
if (string.find)(l_0_0, "add-mppreference", 1, true) ~= nil and ((string.find)(l_0_0, " -exclusionpath (get-location) -force", 1, true) ~= nil or (string.find)(l_0_0, " -exclusionprocess (get-process -pid $pid). -force", 1, true) ~= nil) then
  return mp.INFECTED
end
return mp.CLEAN

