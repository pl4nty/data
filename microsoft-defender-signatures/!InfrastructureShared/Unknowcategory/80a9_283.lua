-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\80a9_283.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.lower)((string.sub)(l_0_0.image_path, -11)) == "wscript.exe" then
  return mp.INFECTED
end
return mp.CLEAN

