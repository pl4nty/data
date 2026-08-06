-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9bb34bd80d2f\1.luac 

-- params : ...
-- function num : 0
if not (versioning.IsSeville)() and not (versioning.IsServer)() then
  return mp.CLEAN
end
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 and reportGenericRansomware((this_sigattrlog[3]).utf8p2, true) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN

