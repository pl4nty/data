-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a4d2_600.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if not peattributes.isdll then
  return mp.CLEAN
end
if l_0_0 > 1000000 then
  return mp.CLEAN
end
if (mp.get_mpattribute)("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_1 = ((MpCommon.PathToWin32Path)((mp.getfilename)(mp.FILEPATH_QUERY_FULL))):lower()
if l_0_1:find("\\program files", 1, true) or l_0_1:find("\\windows\\", 1, true) or l_0_1:find("\\system32\\", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

