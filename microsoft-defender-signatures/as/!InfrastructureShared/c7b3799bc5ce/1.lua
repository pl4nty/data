-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c7b3799bc5ce\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_0, "psexesvc", 1, true) or (string.find)(l_0_0, "batchpatchexesvc", 1, true) then
  return mp.CLEAN
end
Has_NetworkLogonSuccess(true)
return mp.INFECTED

