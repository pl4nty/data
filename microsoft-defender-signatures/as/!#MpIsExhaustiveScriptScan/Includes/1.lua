-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!#MpIsExhaustiveScriptScan\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FULL))
if l_0_0 == nil or #l_0_0 == 0 or l_0_0:sub(-7) ~= ".config" then
  return mp.CLEAN
end
local l_0_1 = "uint ConfigRevision "
local l_0_2 = (mp.BMSearchFile)(0, 512, l_0_1 .. "\144\000")
if l_0_2 == nil or l_0_2 == -1 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_3 = (mp.readfile)(l_0_2 + #l_0_1, 4)
;
(mp.readprotection)(true)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = (string.match)(l_0_3, "%s*(%d+)")
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = "ROQ_SECFG_REV"
if IsKeyValuePairInRollingQueue(l_0_5, l_0_0, l_0_4) then
  return mp.CLEAN
end
if not AppendToRollingQueue(l_0_5, l_0_0, l_0_4, 172800) then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("Lua:SoftEtherConfigScan")
return mp.INFECTED

