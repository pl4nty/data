-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\PUABundlerWin32TelamonBundler\Includes\1_luac 

-- params : ...
-- function num : 0
if (pe.get_versioninfo)() == nil then
  return mp.INFECTED
end
if checkProductVersion("LT", "1.0.252") == true then
  return mp.INFECTED
end
;
(mp.set_mpattribute)("LUA:Telamon.NewProductVersion")
return mp.CLEAN

