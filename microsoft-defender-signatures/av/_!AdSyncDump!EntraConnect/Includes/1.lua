-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!AdSyncDump!EntraConnect\Includes\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Lua:PeOriginalName!win32ntv.dll") then
  return mp.CLEAN
end
if IsADConnectRole() then
  return mp.INFECTED
end
return mp.CLEAN

