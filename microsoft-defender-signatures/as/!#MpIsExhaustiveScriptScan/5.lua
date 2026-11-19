-- Threat: !#MpIsExhaustiveScriptScan
-- Type: 12
-- MpAttributes: Lua:WSFExt & RPF:TopLevelFile & LUA:FileSizeGE1000.A

local l_0_0 = mp.getfilesize()
if 2097152 < l_0_0 then
  return mp.CLEAN
end
if mp.BMSearchFile(0, 4096, "<job\144\000") == -1 then
  return mp.INFECTED
end
return mp.CLEAN
