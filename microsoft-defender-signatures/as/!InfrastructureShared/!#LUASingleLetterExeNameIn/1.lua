-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUASingleLetterExeNameIn\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.getfilename)())
if (string.find)(l_0_0, "%-%>%(rtf[0-9]+%)%-%>[a-z].[a-z]$") ~= nil then
  return mp.INFECTED
else
  if (string.find)(l_0_0, "%-%>%(rtf[0-9]+%)%-%>") ~= nil then
    (mp.set_mpattribute)("//LUA:ExeInRTF")
  end
end
return mp.CLEAN

