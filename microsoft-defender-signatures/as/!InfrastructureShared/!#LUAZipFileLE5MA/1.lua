-- Threat: !InfrastructureShared
-- Name: !#//LUA:ZipFileLE5M.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:FileInZip

local l_0_0 = mp.getfilesize()
if l_0_0 < 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
